#! /bin/sh
#------------------------------------------------------
# Owner : Satinder Singh
#
# Description:
#  This bash shell script contains functions to create menus. 
#  A menu option for exit is added automatically.
#------------------------------------------------------
#
# Usage:
#  Source this file in your script and then use following
#  functions to create and run menus. 
#
# Example:
# - - - - - - -  - -
#! /bin/bash
#
# source this file
#. ./menu.sh
#
#menu action function
#function addGrpDb
#{
#        echo "Code menu handler here"
#}
#
# set menu heading
#menuTitle "News Manager"
#
# add menus
#addMenu "Add Group to db" addGrpDb
#addMenu "Delete Group from db" delGrpDb
#
# Start the main loop
#start
# - - - - - - -  - -

#
#     menuTitle <title> : Sets Heading of the menu 
#     addMenu <menu string> <menu action function name>
#        if string and action are not given then default is added.
#     start : Starts the infinite loop: showMenu, promptInput,run actions
#------------------------------------------------------


title="MENU"
totalItems=-1;



#menuTitle <title> : Sets Heading of the menu 
function menuTitle
{
	title=$1
}

function defaultAct
{
	echo "Dummy action"
}

#addMenu <menu string> <menu action function name>
#  if string and action are not given then default is created
#  for them
function addMenu
{
	n=$totalItems
	n=$(( n + 1 ))

    	tlabel=$1	
	label=${tlabel:=menu$n}
	tact=$2
	act=${tact:=defaultAct}
	labels[$n]=$label
	actions[$n]=$act
	echo "adding item $n . $label ${actions[$n]}"
	totalItems=$n;
}

function showMenu
{
	clear
	echo "============================"
	echo $title
	echo "============================"
	n=${totalItems}
	while test $n -ge 0
	do
		echo "$n.	${labels[$n]}"
		n=$(( n - 1 ))
	done
}

function promptInput
{
	n=${totalItems}
	echo -n "Please Select Menu [0 - $n]:"
	read i
	return $i
}

function runAction
{
	#totalItems=$(( totalItems - 1 ))
	while true
	do
		showMenu
		promptInput
		i=$?
		${actions[$i]}
		echo -n "Press Enter to continue..."
		read
	done
}	

#start : Starts the infinite loop: showMenu, promptInput,run actions
function start
{
	runAction	
}

function refresh
{
	showMenu
}


#trap refresh SIGWINCH
addMenu Exit exit
