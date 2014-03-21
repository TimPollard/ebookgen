#!/usr/bin/env bash

EDITION=""

while getopts ":e:" opt; do
	case $opt in
		e)
			echo "-e/edition was called with $OPTARG"
			EDITION="$OPTARG"
			;;
		\?)
			echo "Invalid option: -$OPTARG" >&2
			exit 1
			;;
		:)
			echo "Option -$OPTARG requires an argument." >&2
			exit 1
			;;
	esac
done

shift $((OPTIND-1))

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

mkdir -p output/${NAME[0]}

for format in "${!BUILD[@]}" ; do
	if [ ${BUILD["$format"]} -ne 0 ] ; then
		echo "Building $format"
		${format}_extra
		pandoc -S -r markdown -w $format -o output/${NAME[0]}/output.${format} -V "edition=$EDITION" $EXTRA_OPTS ${CHAPTERS[0]}
	fi
done
