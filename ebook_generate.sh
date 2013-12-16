#!/usr/bin/env bash

declare -A BUILD=( ['epub']=0 ['doc']=0 )

# Local book differences
source ebook_generate_config.sh

for i in "$@" ; do
	case $i in
		all)
			for format in "${!BUILD[@]}" ; do BUILD["$format"]=1 ; done
			;;
		epub)
			BUILD['epub']=1
			;;
		doc)
			BUILD['doc']=1
			;;
		*)
			echo "$i is not a valid format"
			exit 1
			;;
	esac
done

#pandoc -S -r markdown -w epub -o output.epub \
#	--epub-cover images/cover_simple_one.jpg \
#	front_matter.mkd \
#	chapter_01.mkd \
#	chapter_02.mkd \
#	chapter_03.mkd \
#	chapter_04.mkd \
#	chapter_05.mkd \
#	chapter_06.mkd \
#	chapter_07.mkd \
#	chapter_08.mkd \
#	chapter_09.mkd \
#	chapter_10.mkd \
#	chapter_11.mkd \
#	chapter_12.mkd \
#	chapter_13.mkd \
#	chapter_14.mkd
