# The HTML format for the ebook generator

# Add to the list of formats; the default value of 0 means don't build
BUILD['html']=0

# An extra function; primarily generates the $EXTRA_OPTS from the configuration
# options
function html_extra {
	EXTRA_OPTS="
	--toc
	--standalone
	--ascii
	"
}
