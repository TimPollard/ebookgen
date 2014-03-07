# The DocX format for the ebook generator

# Add to the list of formats; the default value of 0 means don't build
BUILD['docx']=0

# An extra function; primarily generates the $EXTRA_OPTS from the configuration
# options
function docx_extra {
	EXTRA_OPTS="
	--toc
	"
}
