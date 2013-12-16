#!/usr/bin/env bash

# This is a template for the ebook_generate_config.sh file

# What formats to build by default:
BUILD['epub']=1

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
EPUB_CHAPTER_DIV=2
