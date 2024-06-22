#!/bin/bash

#Creating the directories, no errors if the directory already exists
mkdir -p my_documents
mkdir -p my_images
mkdir -p my_videos
mkdir -p Others



for files in *; do #This loop traverses with all the files in the current directory
	if [[ -d "$files" ]]; then
		#Skipping the subdirectories
		continue
	elif [[ "$files" == "file_organizer.sh" ]]; then
		#Skipping the current file
		continue
	fi

	filetype=$( file --mime-type -b "$files" ) #Fetching the extension of a file through the attribute --mime-type
	case "$filetype" in        #Using switch case to segregate the files
	image/*)
		mv "$files" my_images
		;;
	video/*)
		mv "$files" my_videos
		;;
	application/pdf | text/*)
		mv "$files" my_documents
		;;
	*)
		mv "$files" Others
		;;
	esac
done

#Completion of script
