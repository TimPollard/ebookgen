#!/usr/bin/env bash

# Declare the associative array of formats to build (0 means don't build, 1
# means do build)
declare -A BUILD=( ['epub']=0 ['docx']=0 ['html']=0 )

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

function generate {
	echo "Building $1"

	case $1 in
		epub)
			EXTRA_OPTS="
			--epub-cover-image=${COVER_IMAGE[0]}
			--epub-metadata=${EPUB_META[0]}
			--epub-chapter-level=${EPUB_CHAPTER_DIV[0]}
			"
			;;
		docx)
			EXTRA_OPTS="--toc"
			;;
		html)
			EXTRA_OPTS="
			--toc
			--standalone
			--ascii
			"
			;;
		*)
			echo "$1 is not a valid format"
			exit 1
			;;
	esac

	pandoc -S -r markdown -w $1 -o output.$1 $EXTRA_OPTS ${CHAPTERS[0]}
}

for format in "${!BUILD[@]}" ; do
	if [ ${BUILD["$format"]} -ne 0 ] ; then
		generate $format
	fi
done
