#!/bin/bash

#This file simply generates README.md's to all subfolders in this file's path, up to 2 levels of depth
# This is so I can add my empty subfolders in git, which does not allow empty folders, without manually adding READMEs :(

#Example: Let's say this file is located under /folder/ which has the following folder structure:
#/folder/

#/folder/aaa/folderA
#/folder/aaa/folderB

#/folder/bbb/fileC
#/folder/bbb/fileD

# A README.md is then created in /folder/aaa, /folder/aaa/folderA, /folder/aaa/folderB, /folder/bbb/ ... and so on

#=======================
#PS: There should be a better way to do this, this is just what I came up with
#=======================

BASE="/home/rich/ctf_writeups"
current_dir=${PWD##*/}

#The first iteration goes thru all folders in depth level 1
for d in $BASE/*; do
  if [ -d "$d" ]; then
    echo "$d"
    
    #I use cd so that afterwards I can use PWD to get the current dir as a variable
    cd "$d"
    current_dir=${PWD##*/} # gets current depth 1 dir as a variable
    

    #echoes the initial data to a README.md files in depth 1
    echo "Writeups for $current_dir challenges" > "$d/README.md"
    
    #The second iteration goes thru all folders in depth level 2
    for dd in $d/*; do
    	cd "$dd"
    	current_dir=${PWD##*/} #gets current depth level 2 dir as a variable
    	if [ -d "$dd" ]; then
   		
   		 #echoes the initial data to a README.md files in depth 1
    		echo "Writeups for $current_dir challenges" > README.md
    	fi
    done
  fi
done

