#!/usr/bin/env bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

function makeExecutable {
    chmod +x *.sh
}

function softInstall {
    sudo ln -s `pwd`/gordon.sh /usr/bin/gordon
    success "soft installed gordon\n"
    /usr/bin/gordon
}

function hardInstall {
    sudo mkdir -p /opt/gordon
    sudo cp -r * /opt/gordon
    sudo ln -s /opt/gordon/gordon.sh /usr/bin/gordon
    success "installed gordon\n"
    /usr/bin/gordon
}

function checkSource {
    if [ ! -f "$DIR/gordon.sh" ]; then
        if [ -d "/tmp/gordon" ]; then
            rm -rf /tmp/gordon
        fi
        cd /tmp
        git clone https://github.com/Hallian/gordon.git
        cd gordon
    else
        cd $DIR
    fi
    
    source color-echo.sh
}

function clean {
    rm -rf /tmp/gordon
}

checkSource
makeExecutable

if [ ! -z "$1" ]; then
    if [ $1 == "--soft" ]; then
        softInstall
    elif [ $1 == "--hard" ]; then
        hardInstall $2
    else
        error "unknown parameter \"$1\""
    fi
else
    hardInstall
fi

clean