#!/usr/bin/env bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source $DIR/color-echo.sh

if [ -d "chef-repo" ]; then
    cd chef-repo/cookbooks

    for pkg in $@
    do
        COOKBOOK=`knife cookbook site download $pkg 2> /dev/null | grep 'Cookbook saved:' | sed -r 's/Cookbook saved: (.*)/\1/g'`
        tar xzf $COOKBOOK
        rm $COOKBOOK
        colorEcho "green" "downloaded $pkg"
    done
else
    colorEcho "red" "chef-repo missing."
    colorEcho "blue" "run \`gordon init\`"
fi