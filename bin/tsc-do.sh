#!/bin/bash

[ "$1" == "--help" ] && {
    cat <<EOM
Take action when tsc compilation succeeds or fails.

Usage:
    tsc --watch | tsc-do {on-success} {on-error} {on-start}

Examples:
    tsc --watch | tsc-do 'say OK' 'say Failed' 'say Building'
    tsc --watch | tsc-do ./on-success.sh ./on-error.sh ./on-start.sh
    tsc --watch | tsc-do
EOM
    exit 0
}

TSC_ON_SUCCESS=${1:-true}
TSC_ON_ERROR=${2:-true}
TSC_ON_START=${3:-true}

awk '{gsub(/\033c/,"") system("")}1' | while read line; do
    case ${line} in
        *Starting\ *compilation*)
            ${TSC_ON_START}
            ;;
        *error\ TS*)
            STATE="error"
            ;;
        *Compilation\ complete*)
            if [ "$STATE" == "error" ]; then
                ${TSC_ON_ERROR}
            else
                ${TSC_ON_SUCCESS}
            fi

            STATE="waiting"
            ;;
    esac

    echo ${line}
done
