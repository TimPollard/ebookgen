#!/usr/bin/env bash

# This is a template for the ebookgen_config.sh file

# The short name of the book (used by the script, and in filenames)
NAME= 'example'

# What formats to build by default (space separated):
FORMATS='epub html'

# The cover image to use
COVER_IMAGE=images/cover.jpg

# The markdown files to include (space or newline separated
CHAPTERS="
meta.mkd
chapter_01.mkd
chapter_02.mkd
"

# The metadata file (for ePubs)
EPUB_META="metadata.xml"

# The chapter division level (for ePubs)
EPUB_CHAPTER_DIV=1

# Sections are numbered if this is set to true
NUMBER_SECTIONS=false
