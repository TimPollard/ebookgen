#!/usr/bin/env bash

# Declare the supported formats
declare -A BUILD=( ['epub']=0 ['docx']=0 ['html']=0 )

# Local book config
source ebook_generate_config.sh

# Clear the default BUILD hash if something has been passed on the command line
if [ $@ ] ; then
	for format in "${!BUILD[@]}" ; do BUILD["$format"]=0 ; done
fi

for i in "$@" ; do
	case $i in
		all)
			for format in "${!BUILD[@]}" ; do BUILD["$format"]=1 ; done
			;;
		epub)
			BUILD['epub']=1
			;;
		docx)
			BUILD['docx']=1
			;;
		html)
			BUILD['html']=1
			;;
		*)
			echo "$i is not a valid format"
			exit 1
			;;
	esac
done

function generate {
	echo "Building $1"

	case $1 in
		epub)
			EXTRA_OPTS="
			--epub-cover-image=${COVER_IMAGE}
			--epub-metadata=${EPUB_META}
			--epub-chapter-level=${EPUB_CHAPTER_DIV}
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

	pandoc -S -r markdown -w $1 -o output.$1 $EXTRA_OPTS $CHAPTERS
}

for format in "${!BUILD[@]}" ; do
	if [ ${BUILD["$format"]} -ne 0 ] ; then
		generate $format
	fi
done
