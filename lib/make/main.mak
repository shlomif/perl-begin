TARGET = dest

all: all_deps latemp_targets perl_for_newbies_extra_data iperl_extra_data \
	todo_done_data htaccess

all_deps: bulk-make-dirs bad_elements_html run_compass

DOCS_COMMON_DEPS = lib/template.wml

include lib/make/shlomif_common.mak
include lib/make/include.mak
include lib/make/rules.mak
include lib/make/p4n.mak
include lib/make/deps.mak

LATEMP_WML_FLAGS += -DLATEMP_THEME=better-scm -DLATEMP_SERVER=perl_begin

WML_FLAGS += --passoption=2,-X3074 --passoption=3,-I../lib/ \
	--passoption=3,-w $(LATEMP_WML_FLAGS) -I../ -DROOT~. \
	-I../lib/ --passoption=7,"-S imgsize,summary" \
	-I $${HOME}/apps/wml

WML_FLAGS += $(COMMON_PREPROC_FLAGS)

DEST_ARC_PAGE = $(TARGET)/source/index.html

WML_RENDER = LATEMP_WML_FLAGS="$(LATEMP_WML_FLAGS)" $1 bin/render
PROCESS_ALL_INCLUDES = APPLY_TEXTS=1 perl bin/post-incs-v2.pl --mode=minify \
               --minifier-conf=bin/html-min-cli-config-file.conf \
               --texts-dir=lib/ads \
               --source-dir=$(TARGET) \
               --dest-dir=$(TARGET) \
               --

# PROCESS_ALL_INCLUDES = true

define GENERIC_GENERIC_WML_RENDER
$(call DEF_WML_PATH) ( cd $2 && wml -o "$$fn" $(WML_FLAGS) -DLATEMP_FILENAME=$(patsubst $3/%,%,$(patsubst %.wml,%,$@)) $(patsubst $2/%,%,$<) ) && $4 '$(patsubst $(TARGET)/%,%,$@)'
endef

define GENERIC_WML_RENDER
$(call GENERIC_GENERIC_WML_RENDER,$1,$2,$3,$(PROCESS_ALL_INCLUDES))
endef

define PERL_BEGIN_INCLUDE_WML_RENDER
$(call GENERIC_WML_RENDER,src,$(PERL_BEGIN_SRC_DIR),$(PERL_BEGIN_DEST))
endef

define PERL_BEGIN_COMMON_INCLUDE_WML_RENDER
$(call GENERIC_WML_RENDER,src,$(COMMON_SRC_DIR),$(PERL_BEGIN_DEST))
endef

run_compass: src/style.css src/jqui-override.css

src/style.css: config.rb lib/sass/style.scss lib/sass/print.scss lib/sass/vim_syntax_highlighting.scss lib/sass/self_link.scss
	compass compile || rm -f $@

src/jqui-override.css: lib/sass/jqui-override.scss
	compass compile

dest/humour/index.html: lib/retrieved-html-parts/Perl_Humour.html
dest/FAQs/freenode-perl/index.html: lib/retrieved-html-parts/Freenode_Sharp_Perl_FAQ.html
dest/IDEs-and-tools/Perl_developer_tools/index.html: lib/retrieved-html-parts/Perl_developer_tools.html
dest/tutorials/hyperpolyglot/sheet1.html: lib/retrieved-html-parts/hyperpolyglot/scripting.html
dest/topics/files-and-directories/index.html: lib/PerlBegin/TopicsExamples/FilesAndDirs.data.yml lib/PerlBegin/TopicsExamples/FilesAndDirs.pm

dest/learn/index.html: lib/why-perl.wml

# upload: upload_hexten
upload: upload_beta

# Add a dependency on books.wml
$(filter dest/books/%.html,$(PERL_BEGIN_DOCS_DEST)) : lib/books.wml

dest/uses/sys-admin/index.html dest/topics/files-and-directories/index.html: lib/files_dirs_modules.wml

upload_hexten: all
	(cd dest && $(RSYNC) -a * perl-begin@hexten.net:htdocs/)

upload_iglu: all
	(cd dest && $(RSYNC) -a * shlomif@iglu.org.il:/iglu/html/shlomif/Perl-Begin/)

upload_beta: all
	(cd dest && $(RSYNC) -a --inplace * perl-begin@hexten.net:htdocs/__Beta-Quop/)
	(cd dest && $(RSYNC) -a --inplace * $${__HOMEPAGE_REMOTE_PATH}/Perl-Begin/__Beta-Quop/)

upload_local: all
	(cd dest && $(RSYNC) -a --inplace * /var/www/html/shlomif/perl-begin/)

upload_home: all
	(cd dest && $(RSYNC) -a * $${HOMEPAGE_SSH_PATH}/Perl-Begin/)

upload_home_remote: all
	(cd dest && $(RSYNC) -a * $${__HOMEPAGE_REMOTE_PATH}/Perl-Begin/)

update_p4n:
	touch src/tutorials/perl-for-newbies/*/*.wml

rebuild_p4n: update_p4n all

IMPATIENT_PERL_FILES = $(patsubst %,dest/tutorials/impatient-perl/%,iperl.html $(patsubst %,iperl_files/%,iperl_html_m2efc85d6.jpg iperl_html_m5238e28d.jpg))

iperl_extra_data: $(IMPATIENT_PERL_FILES)

$(IMPATIENT_PERL_FILES): dest/tutorials/impatient-perl/%: lib/tutorials/impatient-perl/%
	cp -f $< $@

TODO_DONE = $(patsubst %,$(TARGET)/contribute/%, TODO.txt DONE.txt)

todo_done_data: $(TODO_DONE)

$(TODO_DONE): $(TARGET)/contribute/%.txt: %.txt
	cp -f $< $@

htaccess: $(TARGET)/.htaccess

$(TARGET)/.htaccess: lib/htaccess.txt
	cp -f $< $@

BAD_ELEMENTS_SOURCE_XML = src/tutorials/bad-elements/perl-elements-to-avoid.xml-grammar-vered.xml
BAD_ELEMENTS_XHTML_DIR = lib/tutorials/bad-elements/all-in-one-xhtml/bad-elements

DOCBOOK5_BASE_DIR = lib/docbook/5

DOCBOOK5_SOURCES_DIR := $(DOCBOOK5_BASE_DIR)/xml
DOCBOOK5_RENDERED_DIR := $(DOCBOOK5_BASE_DIR)/rendered
DOCBOOK5_ALL_IN_ONE_XHTML_DIR := $(DOCBOOK5_BASE_DIR)/essays

BAD_ELEMENTS_DB5 := $(DOCBOOK5_SOURCES_DIR)/bad-elements.xml
BAD_ELEMENTS_XHTML := $(DOCBOOK5_ALL_IN_ONE_XHTML_DIR)/bad-elements/all-in-one.xhtml
BAD_ELEMENTS_RENDERED := $(DOCBOOK5_RENDERED_DIR)/bad-elements.xhtml

bad_elements_html: $(BAD_ELEMENTS_XHTML) $(BAD_ELEMENTS_RENDERED)

DOCBOOK5_RELAXNG = lib/sgml/relax-ng/docbook.rng
DOCBOOK5_XSL_STYLESHEETS_PATH := /usr/share/sgml/docbook/xsl-ns-stylesheets
DOCBOOK5_XSL_ONECHUNK_XSLT_STYLESHEET := lib/sgml/shlomif-docbook/xsl-5-stylesheets/shlomif-essays-5-xhtml-onechunk.xsl
DOCBOOK5_XSL_ALL_CUSTOM_STYLESHEETS = $(DOCBOOK5_XSL_ONECHUNK_XSLT_STYLESHEET)

$(BAD_ELEMENTS_DB5): $(BAD_ELEMENTS_SOURCE_XML)
	# jing lib/XML-Grammar-Vered/vered-xml.rng $(BAD_ELEMENTS_SOURCE_XML)
	./bin/translate-Vered-XML --output $@ $(BAD_ELEMENTS_SOURCE_XML)
	# jing $(DOCBOOK5_RELAXNG) $@

# -x lib/sgml/shlomif-docbook/xsl-5-stylesheets/shlomif-essays-5-xhtml-onechunk.xsl
# --basepath $(HOME)/Download/unpack/file/docbook/docbook-xsl-ns-snapshot
$(BAD_ELEMENTS_XHTML): $(BAD_ELEMENTS_DB5) $(DOCBOOK5_XSL_ALL_CUSTOM_STYLESHEETS)
	# jing $(DOCBOOK5_RELAXNG) $<
	docmake --stringparam "generate.toc=article toc,title" --stringparam "docbook.css.source=" --stringparam "root.filename=$@.temp.xml" --basepath $(DOCBOOK5_XSL_STYLESHEETS_PATH) -x $(DOCBOOK5_XSL_ONECHUNK_XSLT_STYLESHEET) xhtml5 $<
	xsltproc --output $@ ./bin/clean-up-docbook-xhtml-1.1.xslt $@.temp.xml.xhtml
	rm -f $@.temp.xml.xhtml
	perl -lpi -e 's/[ \t]+\z//' $@
	perl -lpi -e 's{\Q xmlns="http://docbook.org/ns/docbook"\E}{}g' $@

$(DOCBOOK5_RENDERED_DIR)/%.xhtml: $(DOCBOOK5_ALL_IN_ONE_XHTML_DIR)/%/all-in-one.xhtml
	./bin/clean-up-docbook-5-xsl-xhtml-1_1.pl -o $@ $<

dest/tutorials/bad-elements/index.html: $(BAD_ELEMENTS_RENDERED)
TEST_TARGETS = Tests/*.{py,t}

PERL_BEGIN_DOCS_SRC = $(patsubst $(PERL_BEGIN_DEST)/%,$(PERL_BEGIN_SRC_DIR)/%.wml,$(PERL_BEGIN_DOCS_DEST))

fastrender: $(PERL_BEGIN_DOCS_SRC) all_deps
	@echo $(MAKE) fastrender
	perl bin/tt-render.pl
	@$(PROCESS_ALL_INCLUDES) $(PERL_BEGIN_DOCS) $$(cat lib/make/tt2.txt)

bulk-make-dirs:
	@mkdir -p $(PERL_BEGIN_DIRS_DEST)
