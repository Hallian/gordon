#!/usr/bin/env bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

DEPS=`$DIR/find-deps.sh`

$DIR/download.sh $DEPS