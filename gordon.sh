#!/usr/bin/env bash

function getSrcDir {
    SOURCE="${BASH_SOURCE[0]}"
    while [ -h "$SOURCE" ]; do
      DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
      SOURCE="$(readlink "$SOURCE")"
      [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
    done
    DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
}

function handleArgs {    
    command=($1)
    args=$@
}

function removeCommandFromArgs {    
    command=($args[1])
    args=( "${args[@]/$command}" )
    if [ $args[1] == $command ]; then 
        args=""
    fi
}

function router {
    removeCommandFromArgs
    
    if [ $1 == "init" ]; then
        cmdInit
    elif [ $1 == "download" ]; then
        cmdDownload
    elif [ $1 == "deps" ]; then
        cmdDeps
    elif [ $1 == "help" ]; then
        cmdHelp
    else
        echo -e "unrecognized command '$1'\n"
        cmdHelp
    fi
}

function cmdInit {
    $DIR/init.sh $args
}

function cmdDownload {
    if [ ! -z "$args" ]; then
        $DIR/download.sh $args
    else
        $DIR/auto-download.sh
    fi
}

function cmdDeps {
    $DIR/find-deps.sh $args
}

function cmdHelp {
    cat $DIR/help.txt
}

function main {
    if [ ! -z "$1" ]; then
        handleArgs $@
        router $args
    else
        cmdHelp
    fi
}

getSrcDir
main $@