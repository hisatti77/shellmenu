#! /bin/bash

## Creating parent - child menu
## This is child menu script

. ./menu.sh

function a4
{
	echo -n "some inputs"
	read i
	read j
	echo "$i $j"
}

function a5
{
	./testmenu1.sh
}

menuTitle "Menu Level 2"
addMenu "Menu Item 1"
addMenu 
addMenu "Menu Item 3"
addMenu "Menu Item 4" a4
addMenu "testmenu1" a5
start
