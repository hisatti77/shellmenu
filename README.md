# shellmenu
Shell script to easily create Simple menu based scripts

## Methods
menuTitle <title> : Sets Heading of the menu 
addMenu <menu string> <menu action function name>
if string and action are not given then default is added.
start : Starts the infinite loop: showMenu, promptInput, run actions

## Sample shell script using this code
Sample script below creates this menu and related handlers:
```
============================
News Manager
============================
2.      Delete Group from db
1.      Add Group to db
0.      Exit
Please Select Menu [0 - 2]:
```

### code
```bash
#! /bin/bash

#source this file
. ./menu.sh

#menu action function
function addGrpDb
{
        echo "Code menu handler here"
}

#set menu heading
menuTitle "News Manager"

#add menus
addMenu "Add Group to db" addGrpDb
addMenu "Delete Group from db" delGrpDb

#Start the main loop
start
```
