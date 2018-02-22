#!/bin/bash

[ "$1" == "--help" ] && {
    cat <<EOM
Take action when tsc compilation succeeds or fails.

Usage:
    tsc --watch | tsc-do {comand-when-build-succeeds} {command-when-build-fails}

Examples:
    tsc --watch | tsc-do 'say OK' 'say Failed'
    tsc --watch | tsc-do ./my-success-script.sh ./my-failure-script.sh
    tsc --watch | tsc-do
EOM
    exit 0
}

TSC_ON_SUCCESS=${1:-true}
TSC_ON_ERROR=${2:-true}

awk '{gsub(/\033c/,"") system("")}1' | while read line; do
    echo ${line}

    case ${line} in
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
done
