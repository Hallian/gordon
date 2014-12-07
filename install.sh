#!/usr/bin/env bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

function makeExecutable {
    chmod +x $DIR/*.sh
}

function softInstall {
    ln -s $DIR/gordon.sh /usr/bin/gordon
    echo -e "soft installed gordon\n"
    /usr/bin/gordon
}

function hardInstall {
    mkdir -p /opt/gordon
    cp -r $DIR/* /opt/gordon
    ln -s /opt/gordon/gordon.sh /usr/bin/gordon
    echo -e "installed gordon\n"
    /usr/bin/gordon
}

makeExecutable

if [ ! -z "$1" ]; then
    if [ $1 == "--soft" ]; then
        softInstall
    elif [ $1 == "--hard" ]; then
        hardInstall $2
    else
        echo "unknown parameter \"$1\""
    fi
else
    hardInstall
fi