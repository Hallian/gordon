#!/usr/bin/env bash

wget http://github.com/opscode/chef-repo/tarball/master &> /dev/null
tar -zxf master
if [ ! -d 'chef-repo' ]; then
    mv opscode-chef-repo* chef-repo
    echo "set up \"chef-repo\""
else
    echo "Warning: \"chef-repo\" already exists"
    echo "set up \"`ls -1 | grep opscode-chef-repo`\""
fi
rm master