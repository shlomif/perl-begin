MODULES_LIST = $(LATEMP_ROOT_SOURCE_DIR)/bin/required-modules.yml

BIN = deps-app

STAMP = lib/make/build-deps/build-deps.stamp

all: $(STAMP)

$(STAMP): $(MODULES_LIST)
	$(BIN) verify -o $@ --input $(MODULES_LIST) --input ./bin/common-required-deps.yml

clean:
	rm -f $(STAMP)
