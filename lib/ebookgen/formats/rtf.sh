# The RTF format for the ebook generator

# Add to the list of formats; the default value of 0 means don't build
BUILD['rtf']=0

# An extra function; primarily generates the $EXTRA_OPTS from the configuration
# options
function rtf_extra {
	EXTRA_OPTS="
	--standalone
	"
}
