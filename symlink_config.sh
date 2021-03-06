#!/bin/bash

mydir="../dash2-config"
len=$((${#mydir} + 1))
CURRENTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo $CURRENTDIR

find "$mydir" -name '*.yml' | while read -r line
do
	shortfn=${line:len}
        fullfn="$CURRENTDIR/$line"
	if [ -h $shortfn ]; then
               echo "file $shortfn is already symlinked" 
            else
               echo "symlinking $shortfn"
               ln -s "$fullfn" "$shortfn"
            fi
done
	
