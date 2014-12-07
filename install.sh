#!/usr/bin/env bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source $DIR/color-echo.sh

function makeExecutable {
    chmod +x $DIR/*.sh
}

function softInstall {
    ln -s $DIR/gordon.sh /usr/bin/gordon
    colorEcho "green" "soft installed gordon\n"
    /usr/bin/gordon
}

function hardInstall {
    mkdir -p /opt/gordon
    cp -r $DIR/* /opt/gordon
    ln -s /opt/gordon/gordon.sh /usr/bin/gordon
    colorEcho "green" "installed gordon\n"
    /usr/bin/gordon
}

makeExecutable

if [ ! -z "$1" ]; then
    if [ $1 == "--soft" ]; then
        softInstall
    elif [ $1 == "--hard" ]; then
        hardInstall $2
    else
        colorEcho "red" "unknown parameter \"$1\""
    fi
else
    hardInstall
fi