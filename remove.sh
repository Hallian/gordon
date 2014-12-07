#!/usr/bin/env bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source $DIR/color-echo.sh

sudo rm -rf /usr/bin/gordon /opt/gordon
colorEcho "green" "removed gordon"