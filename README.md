# PVRTexTool wrapper for Unity3D

## What

Slow PVRTexTool performance on high compression quality settings was always a bane of Unity development. This small utility is supposed to replace PVRTexTool binary and change quality settings when PVRTexTool is run.

This is not recompiled or some hacked PVRTexTool, this is just the smallest possible wrapper that launches original PVRTexTool with some commandline parameters changed. Before copying this over your original, you should copy original PVRTexTool.exe to PVRTexTool_orig.exe - the last one would be called from wrapper.

## Why

We building all our projects on build server. We don't want our developers to suffer abysmally long time when someone pushes new texture or when they change project type. That why all our developers use this wrapper to improve speed of texture compression.

Buildserver use original Unity3D instalation and always processs texture as intended, so we end up with fast development and slow production builds (sometimes).

## For whom

Use this wisely. Using this utility whould result in your compressions setting to work as Fast (or even faster - unity use 1 level above worst for Fast quality setting) with texture quality suffer accordingly. 

The only time you should need this if you have a buildserver that would build your builds with original PVRTexTool, when going to production.

## How

For MacOS just run `macos_install.sh`

else:

Find your Unity3D installation's Tools dirrectory:

Mac: `/Applications/Unity/Unity.app/Contents/Tools`

Windows: `C:\Program Files (x86)\Unity\Editor\Data\Tools\`

There your should find `PVRTexTool` (on Mac) or `PVRTexTool.exe` (on Windows). You should rename it to `PVRTexTool_orig` (on Mac) or to `PVRTexTool_orig.exe` (on Windows).

Then you should copy PVRTexTool (or PVRTexTool.exe for Windows) from this repository to Tools directory - over your old PVRTexTool binary.

## Uninstall

On MacOS you can run `macos_uninstall.sh`. 

On Windows: Just rename PVRTexTool_orig to PVRTexTool

## Building

No building is nescessary for Mac, because it's a simple shell script.

For windows there is already a binary compiled with Mono. It's vainila .NET without any dependencies and can be build in VS without problems

## Notice on Unity3D update

You should perform installation after every Unity3D update, because after every update unity would just replace PVRTexTool with it's own.
