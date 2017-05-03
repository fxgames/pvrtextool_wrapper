#!/bin/bash

#!/bin/bash
for unity_dir in /Applications/Unity* 
do
	WRAPPER_LOCATION="${unity_dir}/Unity.app/Contents/Tools/PVRTexTool"
	ORIGINAL_LOCATION="${unity_dir}/Unity.app/Contents/Tools/PVRTexTool_orig"

	echo "Uninstalling from ${unity_dir}"

	if [ -f "$ORIGINAL_LOCATION" ]; then
		echo "Removing wrapper"
		cp "$ORIGINAL_LOCATION" "$WRAPPER_LOCATION"
		echo "Done"
	else
		echo "Original PVRTexTool not found. Doing nothing."
	fi
done