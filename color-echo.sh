#!/usr/bin/env bash

declare -A colors
colors["black"]='\033[0;30m'
colors["darkgray"]='\033[1;30m'
colors["blue"]='\033[0;34m'
colors["lightblue"]='\033[1;34m'
colors["green"]='\033[0;32m'
colors["lightgreen"]='\033[1;32m'
colors["cyan"]='\033[0;36m'
colors["lightcyan"]='\033[1;36m'
colors["red"]='\033[0;31m'
colors["lightred"]='\033[1;31m'
colors["purple"]='\033[0;35m'
colors["lightpurple"]='\033[1;35m'
colors["brown"]='\033[0;33m'
colors["yellow"]='\033[1;33m'
colors["lightgray"]='\033[0;37m'
colors["white"]='\033[1;37m'
colors["NC"]='\033[0m' # No Color

function colorEcho {
    if [ ! -z "$1" ]; then
        echo -e "${colors[$1]}$2${colors['NC']}"
    else
        echo -e "$2"
    fi
}