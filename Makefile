
TARGET = dest

WML_FLAGS += -DLATEMP_THEME=better-scm -DLATEMP_SERVER=berlios

LATEMP_WML_FLAGS =$(shell latemp-config --wml-flags)
COMMON_PREPROC_FLAGS = -I $$HOME/conf/wml/Latemp/lib 

WML_FLAGS += --passoption=2,-X3074 --passoption=3,-I../lib/ \
	--passoption=3,-w $(LATEMP_WML_FLAGS) -I../ -DROOT~. \
	-I../lib/ --passoption=7,"-S imgsize" \
	-I $${HOME}/apps/wml

TTML_FLAGS += $(COMMON_PREPROC_FLAGS) -I lib
WML_FLAGS += $(COMMON_PREPROC_FLAGS)

RSYNC = rsync --progress --verbose --rsh=ssh 

ARC_NAME := $(shell cd temp && ./get-arc-name.sh)

DEST_ARC_PAGE = $(TARGET)/source/index.html

DOCS_COMMON_DEPS = template.wml lib/books.wml

all: run_compass latemp_targets perl_for_newbies_extra_data iperl_extra_data

include include.mak
include rules.mak
include p4n.mak

run_compass: src/style.css

src/style.css: config.rb lib/sass/style.sass lib/sass/print.sass
	compass

# upload: upload_hexten
upload: upload_beta

upload_berlios: all
	(cd dest && $(RSYNC) -a * shlomif@shell.berlios.de:/home/groups/perl-begin/htdocs/)

upload_hexten: all
	(cd dest && $(RSYNC) -a * perl-begin@hexten.net:htdocs/)

upload_iglu: all
	(cd dest && $(RSYNC) -a * shlomif@iglu.org.il:/iglu/html/shlomif/Perl-Begin/)

upload_beta: all
	(cd dest && $(RSYNC) -a --inplace * perl-begin@hexten.net:htdocs/__Beta-Quop/)

DEST_ARC_NAME = $(TARGET)/source/arcs/$(ARC_NAME)

upload_home: all
	(cd dest && $(RSYNC) -a * $${HOMEPAGE_SSH_PATH}/Perl-Begin/)

update_p4n:
	touch src/tutorials/perl-for-newbies/*/*.wml

rebuild_p4n: update_p4n all

IMPATIENT_PERL_FILES = $(patsubst %,dest/tutorials/impatient-perl/%,iperl.html $(patsubst %,iperl_files/%,iperl_html_m2efc85d6.jpg iperl_html_m5238e28d.jpg))

iperl_extra_data: $(IMPATIENT_PERL_FILES)

$(IMPATIENT_PERL_FILES): dest/tutorials/impatient-perl/%: lib/tutorials/impatient-perl/%
	cp -f $< $@

# .PHONY: 
# 
# $(DEST_ARC_PAGE) :: $(TARGET)/% : src/%.wml $(LIBRARY_FILES) .PHONY
# 	(cd src && wml $(WML_FLAGS) -DARCNAME=$(ARC_NAME) -DFILENAME=$(patsubst src/%.wml,%,$<) $(patsubst src/%,%,$<)) > $@
# 
# arc: $(DEST_ARC_NAME) $(DEST_ARC_PAGE)
# 
# $(DEST_ARC_NAME):
# 	(cd temp && ./make-archive.sh)
# 	mv temp/$(ARC_NAME) $@
# 
# upload_arc: arc
# 	$(RSYNC) $(ARC_NAME) shlomif@shell.berlios.de:
# 
