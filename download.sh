#!/usr/bin/env bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

if [ -d "chef-repo" ]; then
    cd chef-repo/cookbooks

    for pkg in $@
    do
        COOKBOOK=`knife cookbook site download $pkg 2> /dev/null | grep 'Cookbook saved:' | sed -r 's/Cookbook saved: (.*)/\1/g'`
        tar xzf $COOKBOOK
        rm $COOKBOOK
        echo "downloaded $pkg"
    done
else
    echo "chef-repo missing. run \`gordon init\`"
fi