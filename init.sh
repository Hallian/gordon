#!/usr/bin/env bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

source $DIR/color-echo.sh

function downloadAndExtract {
    if [ ! -d $1 ]; then
        mkdir -p $1
        cd $1

        wget http://github.com/opscode/chef-repo/tarball/master &> /dev/null
        tar -zxf master -C $1 --strip-components 1
        rm master

        colorEcho "green" "set up \"$1\""
    else
        colorEcho "red" "Warning: \"$1\" already exists"
    fi
}


if [ ! -d '/var/chef' ]; then
    downloadAndExtract /var/chef
elif [ ! -z "$1" ]; then
    downloadAndExtract $1
else
    colorEcho "red" "Warning: \"/var/chef\" already exists\n"
    $DIR/gordon.sh help
fi

