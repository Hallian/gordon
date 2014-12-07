#!/usr/bin/env bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source $DIR/color-echo.sh

if [ -d "cookbooks" ]; then
    cd cookbooks

    for pkg in $@
    do
        COOKBOOK=`knife cookbook site download $pkg 2> /dev/null | grep 'Cookbook saved:' | sed -r 's/Cookbook saved: (.*)/\1/g'`
        tar xzf $COOKBOOK
        rm $COOKBOOK
        success "downloaded $pkg"
    done
else
    error "cookbooks folder missing."
    info "go to your chef repo, e.g. \`cd /var/chef\`"
fi