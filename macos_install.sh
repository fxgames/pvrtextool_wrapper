#!/bin/bash

ORIGINAL_LOCATION=/Applications/Unity/Unity.app/Contents/Tools/PVRTexTool
if [ -f $ORIGINAL_LOCATION ]; then
	echo "Creating a copy of the original"
	cp ${ORIGINAL_LOCATION} ${ORIGINAL_LOCATION}_orig
	echo "Copying wrapper"
	cp PVRTexTool $ORIGINAL_LOCATION
	echo "Done"
else
	echo "Unity PVRTexTool not found. Doing nothing."
	exit 1
fi
