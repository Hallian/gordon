#!/usr/bin/env bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

DEPS=""
function handleRuby {
    METADATAS=`find cookbooks -name metadata.rb`

    for meta in $METADATAS
    do
        pkg=`grep "depends '.*'" $meta | sed -r "s/^depends '([a-z 0-9 \_ \-]*)'.*$/\1/g"`
        if [ "$pkg" != "" ]; then
            DEPS+=" $pkg"
        fi
    done
}

function handleJson {
    METADATAS=`find cookbooks -name metadata.json`

    for meta in $METADATAS
    do
        pkg=`nodejs $DIR/load-deps.js $meta`
        if [ "$pkg" != "" ]; then
            DEPS+=" $pkg"
        fi
    done   
}

function printDeps {
    printOnePerLine | sed ':a;N;$!ba;s/\n/ /g' 
}

function printOnePerLine {
    echo $DEPS | tr -s [:space:] \\n | sort -u
}

handleRuby
handleJson
if [ ! -z "$1" ]; then
    if [ $1 == "-1" ]; then
        printOnePerLine
    fi
else
    printDeps
fi