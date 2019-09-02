#!/bin/bash

if [ -t 0 ]; then
	while IFS='' read -r y; do
		x="$x$y\n"
	done < $1
	echo -e "[START type=file]\n"$x"\n[END]"
else
	while IFS='' read -r y; do
		x="$x$y\n"
	done
	echo -e "[START type=redirect]\n$x\n[END]"
fi
