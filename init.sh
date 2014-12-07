#!/usr/bin/env bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

source $DIR/color-echo.sh

function initRepo {
    if [ ! -d $1 ]; then
        mkdir -p $1
        cd $1

        wget http://github.com/opscode/chef-repo/tarball/master &> /dev/null
        tar -zxf master --strip-components 1
        rm master

        success "set up \"$1\""
    else
        error "Warning: \"$1\" already exists"
        info "see \`gordon help\` for more help"
    fi
}

if [ ! -z "$1" ]; then
    initRepo $1
else
    initRepo /var/chef
fi
