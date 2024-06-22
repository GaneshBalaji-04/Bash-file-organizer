#!/bin/bash

#Creating the directories, no errors if the directory already exists
mkdir -p documents
mkdir -p images
mkdir -p videos
mkdir -p others



for files in *; do #This loop traverses with all the files in the current directory
	if [[ -d "$files" ]]; then
		#Skipping the subdirectories
		continue
	elif [[ "$files" == "file_organizer.sh" ]]; then
		continue
	fi

	filetype=$( file --mime-type -b "$files" ) #Fetching the extension of a file through the attribute --mime-type
	case "$filetype" in        #Using switch case to segregate the files
	image/*)
		mv "$files" images
		;;
	video/*)
		mv "$files" videos
		;;
	application/pdf | text/*)
		mv "$files" documents
		;;
	*)
		mv "$files" others
		;;
	esac
done

#Completion of script