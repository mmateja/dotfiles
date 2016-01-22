#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
TEMP_FILE="/tmp/git-chain-rebase-commands"

ruby $DIR/rebase-file-modifier.rb $1 > $TEMP_FILE
cp $TEMP_FILE $1
rm $TEMP_FILE
vim $1

