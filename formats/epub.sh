# The Epub format for the ebook generator

# Add to the list of formats; the default value of 0 means don't build
BUILD['epub']=0

# An extra function; primarily generates the $EXTRA_OPTS from the configuration
# options
function epub_extra {
	EXTRA_OPTS="
	--epub-cover-image=${COVER_IMAGE[0]}
	--epub-metadata=${EPUB_META[0]}
	--epub-chapter-level=${EPUB_CHAPTER_DIV[0]}
	--template=$( dirname "$0" )/templates/epub.txt
	"
}
