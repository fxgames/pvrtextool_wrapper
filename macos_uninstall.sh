#!/bin/bash

WRAPPER_LOCATION=/Applications/Unity/Unity.app/Contents/Tools/PVRTexTool
ORIGINAL_LOCATION=/Applications/Unity/Unity.app/Contents/Tools/PVRTexTool_orig

if [ -f $ORIGINAL_LOCATION ]; then
	echo "Removing wrapper"
	cp $ORIGINAL_LOCATION $WRAPPER_LOCATION
	echo "Done"
else
	echo "Original PVRTexTool not found. Doing nothing."
	exit 1
fi
