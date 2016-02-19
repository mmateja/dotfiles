#!/bin/bash

function push_branch {
	read -p "push $1 with force? [yN] " -n 1 -r
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]
	then
	    git push -f origin $1:$1
	fi
}

