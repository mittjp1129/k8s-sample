#! /usr/bin/env bash

TOP_DIR=`dirname $0`
SCREEN_NAME="k8sdebug"
SCREEN_FILE="k8s-screenrc"

SCREENRC=$TOP_DIR/$SCREEN_FILE
# if screenrc exists, run screen
if [[ -e $SCREENRC ]]; then
    if screen -ls | egrep -q "[0-9]+.${SCREEN_NAME}"; then
        echo "Attaching to already started screen session.."
        exec screen -r $SCREEN_NAME
    fi
    exec screen -c $SCREENRC
fi

echo "Couldn't find $SCREENRC file;"
exit 1

