#!/bin/bash

# This is a fake unit test intented to demonstrate "git bisect"
# It only checks that index.html title tag looks like:
# <title>Git Basics - Live coding session</title>

if [ ! -f ./index.html ]; then
    echo "E"
    # tell the caller this is untestable as file doesn't exist
	status=125
else
	if grep --quiet '<title>Git Basics - Live coding session</title>' ./index.html; then
		echo "."
		# tell the caller this test succeeded
		status=0
	else
		echo "F"
		# tell the caller this test failed
		status=1
	fi
fi

# return control
exit $status
