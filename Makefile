
TARGET = dest

# PAGES = about articles/index books/index core-doc/index index irc/index mailing-lists/index links/index site-resources/index tutorials/index web-forums/index

# SUBDIRS = articles books core-doc irc links mailing-lists tutorials site-resources source source/arcs web-forums

include defs.mak


SOURCES = $(addprefix src/,$(addsuffix .html.wml,$(PAGES)))

DESTS = $(patsubst src/%.html.wml,$(TARGET)/%.html,$(SOURCES))

RAW_FILES = style.css
RAW_FILES_SOURCES = $(addprefix src/,$(RAW_FILES))
RAW_FILES_DEST = $(addprefix $(TARGET)/,$(RAW_FILES))

PODS = $(addprefix docs/,roadmap spec whitepaper version-0.2-spec)
PODS_DESTS_HTMLS = $(patsubst %,$(TARGET)/%.html,$(PODS))
PODS_DESTS_PODS = $(patsubst %,$(TARGET)/%.pod,$(PODS))

# PACKAGES_DIR = $(TARGET)/download/arcs
# PACKAGES = $(shell cd temp && cd lk-module-compiler-final && ls)
# PACKAGES_DESTS = $(addprefix $(PACKAGES_DIR)/,$(PACKAGES))

SUBDIRS_DEST = $(addprefix $(TARGET)/,$(SUBDIRS))

WML_FLAGS += --passoption=2,-X --passoption=7,"-S imgsize" -DROOT~.

RSYNC = rsync --progress --verbose --rsh=ssh 

ARC_NAME := $(shell cd temp && ./get-arc-name.sh)

DEST_ARC_PAGE = $(TARGET)/source/index.html

LIBRARY_FILES = template.wml lib/books.wml

all: dest $(SUBDIRS_DEST) $(DESTS) $(RAW_FILES_DEST)

dest:
	if [ ! -e $@ ] ; then mkdir $@ ; fi
	
$(DESTS) :: $(TARGET)/% : src/%.wml $(LIBRARY_FILES)
	(cd src && wml $(WML_FLAGS) -DFILENAME=$(patsubst src/%.wml,%,$<) $(patsubst src/%,%,$<)) > $@

$(RAW_FILES_DEST) :: $(TARGET)/% : src/%
	cp -f $< $@

$(SUBDIRS_DEST) :: % : unchanged
	if [ ! -e $@ ] ; then mkdir $@ ; fi

$(PODS_DESTS) :: $(TARGET)/% : src/%
	cp -f $< $@

$(PODS_DESTS_HTMLS) :: $(TARGET)/%.html : src/%.pod
	pod2html $< > $@

# $(PACKAGES_DESTS) :: $(PACKAGES_DIR)/% : ./temp/lk-module-compiler-final/%
# 	cp -f $< $@

upload: upload_berlios

upload_berlios: all
	(cd dest && $(RSYNC) -r * shlomif@shell.berlios.de:/home/groups/perl-begin/htdocs/)

upload_iglu: all
	(cd dest && $(RSYNC) -r * shlomif@iglu.org.il:/iglu/html/shlomif/Perl-Begin/)

DEST_ARC_NAME = $(TARGET)/source/arcs/$(ARC_NAME)

.PHONY: 

$(DEST_ARC_PAGE) :: $(TARGET)/% : src/%.wml $(LIBRARY_FILES) .PHONY
	(cd src && wml $(WML_FLAGS) -DARCNAME=$(ARC_NAME) -DFILENAME=$(patsubst src/%.wml,%,$<) $(patsubst src/%,%,$<)) > $@

arc: $(DEST_ARC_NAME) $(DEST_ARC_PAGE)

$(DEST_ARC_NAME):
	(cd temp && ./make-archive.sh)
	mv temp/$(ARC_NAME) $@

upload_arc: arc
	$(RSYNC) $(ARC_NAME) shlomif@shell.berlios.de:

