#!/bin/bash
for unity_dir in /Applications/Unity* 
do
	ORIGINAL_LOCATION="${unity_dir}/Unity.app/Contents/Tools/PVRTexTool"
	COPY_OF_ORIGINAL_LOCATION="${unity_dir}/Unity.app/Contents/Tools/PVRTexTool_orig"

	echo "Installing into ${unity_dir}"

	if [ -f $COPY_OF_ORIGINAL_LOCATION ]; then
		echo "Already installed here."
	else
		if [ -f $ORIGINAL_LOCATION ]; then
			echo "Creating a copy of the original"
			cp ${ORIGINAL_LOCATION} ${COPY_OF_ORIGINAL_LOCATION}
			echo "Copying wrapper to ${COPY_OF_ORIGINAL_LOCATION}"
			cp PVRTexTool $ORIGINAL_LOCATION
			echo "Done"
		else
			echo "Unity PVRTexTool not found. Doing nothing."
		fi
	fi
done
