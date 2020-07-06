TARGET = dest

all: all_deps latemp_targets perl_for_newbies_extra_data iperl_extra_data \
	todo_done_data htaccess

all_deps: bulk-make-dirs bad_elements_html run_compass

include lib/make/shlomif_common.mak
include lib/make/include.mak
include lib/make/rules.mak
include lib/make/p4n.mak
include lib/make/deps.mak

DEST_ARC_PAGE = $(TARGET)/source/index.html

PROCESS_ALL_INCLUDES = APPLY_TEXTS=1 perl bin/post-incs-v2.pl --mode=minify \
               --minifier-conf=bin/html-min-cli-config-file.conf \
               --texts-dir=lib/ads \
               --source-dir=$(TARGET) \
               --dest-dir=$(TARGET) \
               --

# PROCESS_ALL_INCLUDES = true

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

dest/learn/index.html: lib/why-perl.tt2

# upload: upload_hexten
upload: upload_beta

HOMEPAGE_PERL_BEGIN_REMOTE := $${__HOMEPAGE_REMOTE_PATH}/Perl-Begin/

upload_hexten: all
	(cd dest && $(RSYNC) -a * perl-begin@hexten.net:htdocs/)

upload_beta: all
	(cd dest && $(RSYNC) -a --inplace * perl-begin@hexten.net:htdocs/__Beta-Quop/ )
	(cd dest && $(RSYNC) -a --inplace * "$(HOMEPAGE_PERL_BEGIN_REMOTE)"/__Beta-Quop/ )

upload_local: all
	(cd dest && $(RSYNC) -a --inplace * /var/www/html/shlomif/perl-begin/ )

upload_home_remote: all
	(cd dest && $(RSYNC) -a * "$(HOMEPAGE_PERL_BEGIN_REMOTE)" )

update_p4n:
	touch src/tutorials/perl-for-newbies/*/index.tt2

rebuild_p4n: update_p4n all

IMPATIENT_PERL_FILES = $(patsubst %,dest/tutorials/impatient-perl/%,iperl.html $(patsubst %,iperl_files/%,iperl_html_m2efc85d6.jpg iperl_html_m5238e28d.jpg))

iperl_extra_data: $(IMPATIENT_PERL_FILES)

$(IMPATIENT_PERL_FILES): dest/tutorials/impatient-perl/%: lib/tutorials/impatient-perl/%
	$(call COPY)

TODO_DONE = $(patsubst %,$(TARGET)/contribute/%, TODO.txt DONE.txt)

todo_done_data: $(TODO_DONE)

$(TODO_DONE): $(TARGET)/contribute/%.txt: %.txt
	$(call COPY)

htaccess: $(TARGET)/.htaccess

$(TARGET)/.htaccess: lib/htaccess.txt
	$(call COPY)

BAD_ELEMENTS_SOURCE_XML = src/tutorials/bad-elements/perl-elements-to-avoid.xml-grammar-vered.xml
BAD_ELEMENTS_XHTML_DIR = lib/tutorials/bad-elements/all-in-one-xhtml/bad-elements

DOCBOOK5_BASE_DIR = lib/docbook/5

DOCBOOK5_SOURCES_DIR := $(DOCBOOK5_BASE_DIR)/xml
DOCBOOK5_RENDERED_DIR := $(DOCBOOK5_BASE_DIR)/rendered
DOCBOOK5_ALL_IN_ONE_XHTML_DIR := $(DOCBOOK5_BASE_DIR)/essays

BAD_ELEMENTS_DB5 := $(DOCBOOK5_SOURCES_DIR)/bad-elements.xml
BAD_ELEMENTS_XHTML := $(DOCBOOK5_ALL_IN_ONE_XHTML_DIR)/bad-elements/all-in-one.xhtml
BAD_ELEMENTS_RENDERED := $(DOCBOOK5_RENDERED_DIR)/bad-elements.xhtml

bad_elements_html: $(BAD_ELEMENTS_RENDERED)

# DOCBOOK5_RELAXNG = lib/sgml/relax-ng/docbook.rng
DOCBOOK5_XSL_STYLESHEETS_PATH := /usr/share/sgml/docbook/xsl-ns-stylesheets
DOCBOOK5_XSL_ONECHUNK_XSLT_STYLESHEET := lib/sgml/shlomif-docbook/xsl-5-stylesheets/shlomif-essays-5-xhtml-onechunk.xsl
DOCBOOK5_XSL_ALL_CUSTOM_STYLESHEETS := $(DOCBOOK5_XSL_ONECHUNK_XSLT_STYLESHEET)

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
	perl -lpi -e 's{(</?h)([0-9]+)}{$$1.($$2-1)}eg' $@

$(DOCBOOK5_RENDERED_DIR)/%.xhtml: $(DOCBOOK5_ALL_IN_ONE_XHTML_DIR)/%/all-in-one.xhtml
	./bin/clean-up-docbook-5-xsl-xhtml-1_1.pl -o $@ $<

dest/tutorials/bad-elements/index.html: $(BAD_ELEMENTS_RENDERED)

TEST_TARGETS = Tests/*.{py,t}

PERL_BEGIN_DOCS_SRC := $(patsubst $(PERL_BEGIN_DEST)/%,$(PERL_BEGIN_SRC_DIR)/%.tt2,$(PERL_BEGIN_DOCS_DEST))

fastrender: $(PERL_BEGIN_DOCS_SRC) all_deps
	@echo $(MAKE) fastrender
	perl bin/tt-render.pl
	@$(PROCESS_ALL_INCLUDES) $(PERL_BEGIN_DOCS) $$(cat lib/make/tt2.txt)

bulk-make-dirs:
	@mkdir -p $(PERL_BEGIN_DIRS_DEST)

dest/js/jq.js: node_modules/jquery/dist/jquery.min.js
	$(call COPY)

all_deps: dest/js/jq.js
