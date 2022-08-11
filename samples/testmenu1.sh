#! /bin/bash

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
	./testmenu2.sh
}

menuTitle "Menu Level 1"
addMenu "Menu Item 1"
addMenu 
addMenu "Menu Item 3"
addMenu "Menu Item 4" a4
addMenu "testmenu2" a5
start
