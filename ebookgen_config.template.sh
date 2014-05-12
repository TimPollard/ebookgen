#!/usr/bin/env bash

# This is a template for the ebookgen_config.sh file

# The short name of the book (used by the script, and in filenames)
NAME[0] = 'example'

# What formats to build by default (space separated):
FORMATS[0]='epub html'

# The cover image to use
COVER_IMAGE[0]=images/cover.jpg

# The markdown files to include (space or newline separated
CHAPTERS[0]="
meta.mkd
chapter_01.mkd
chapter_02.mkd
"

# The metadata file (for ePubs)
EPUB_META[0]="metadata.xml"

# The chapter division level (for ePubs)
EPUB_CHAPTER_DIV[0]=1

# For additional ebooks in the same directory:
## NAME[1]='example2'
## FORMATS[1]='epub']
## COVER_IMAGE[1]=images/cover.jpg
## CHAPTERS[1]="example.mkd"
## EPUB_META[1]="metadata2.xml"
## EPUB_CHAPTER_DIV[1]=2
