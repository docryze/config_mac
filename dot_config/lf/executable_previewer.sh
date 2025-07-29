#!/bin/bash


file_type="$(file --mime-type -Lb "$1")"

if [[ "$1" =~ \.(md|markdown)$ ]] && [[ $file_type == text/plain ]];
then
    CLICOLOR_FORCE=1 glow -p -s dark $1
    exit 0
fi

case $file_type in
    image/*) 
        chafa --colors full $1
        ;;
    text/*) 
        bat --style=numbers --color=always $1
        ;;
    *) 
        #for f in $fx; do $OPENER $f > /dev/null 2> /dev/null & done
        ;;
esac
