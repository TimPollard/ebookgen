#!/usr/bin/env bash

# Declare the associative array of formats to build (0 means don't build, 1
# means do build)
declare -A BUILD

# Import the supported formats
for file in $( dirname "$0" )/formats/*.sh ; do source $file ; done

# Local book config
source ebook_generate_config.sh

if [ $@ ] ; then # Build whatever the user requested on the command line
	for i in "$@" ; do
		if [ "$1" == "all" ]; then
			for format in "${!BUILD[@]}" ; do BUILD["$format"]=1 ; done
		else
			if [ ${BUILD["$1"]} ]; then
				BUILD["$1"]=1
			else
				echo "$i is not a valid format"
				exit 1
			fi
		fi
	done
else # Build the default formats from the config file
	for format in ${FORMATS[0]} ; do
		if [ ${BUILD["$format"]} ]; then
			BUILD["$format"]=1
		else
			echo "$format [from the config file] is not a valid format"
			exit 1
		fi
	done
fi

for format in "${!BUILD[@]}" ; do
	if [ ${BUILD["$format"]} -ne 0 ] ; then
		echo "Building $format"
		${format}_extra
		pandoc -S -r markdown -w $format -o output.$format $EXTRA_OPTS ${CHAPTERS[0]}
	fi
done
