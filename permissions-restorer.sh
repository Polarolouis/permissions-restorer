#!/bin/bash

usage () {
    echo "Description: $(basename "$0") is an utility script to restore permissions recursively in a folder." 
    echo "To use it you MUST HAVE a backup with correct permissions to act as a reference."
    echo "Usage: "
    echo "$(basename "$0") REFERENCE TARGET"
    echo ""
    echo "Arguments:"
    echo "REFERENCE: the root folder with corrects permissions"
    echo "TARGET: the root folder for which the permissions needs to be adjusted"
}

copy_perms () {
    echo "-Folder $1-"

    for FILE in $1/* # Loop over the files in the folder given as first arg
    do
        echo "Reference File: $FILE"
        echo "File to change: $2/"$(basename "$FILE")""
        # Chown uses the $FILE as the reference for the perms
        # to apply to the file to change
        chown --reference="$FILE" $2/"$(basename "$FILE")"
        chmod --reference="$FILE" $2/"$(basename "$FILE")"

        # Is the file to change a directory ?
        if [[ -d "$FILE" ]]; then
        # If it is we loop over its content
            echo "$FILE is actually a directory !"
            copy_perms $FILE "$2/$(basename "$FILE")"
        fi
    done
    echo "-----------------------------------------------"
}

# This line to go over dotfiles and dotfolders
shopt -s dotglob

if [ -z "$1" ] || [ -z "$2" ]; then
    echo "ERROR: Missing at least one of the required arguments !"
    echo ""
    usage
else
    copy_perms $1 $2
fi