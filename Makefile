# See the README for installation instructions.

BROWSERIFY = ./node_modules/.bin/browserify
COFFEESCRIPT_COMPILER = ./node_modules/.bin/coffee
JSHINT = ./node_modules/.bin/jshint

JS_FILES = $(shell find src -name '*.js' -print)
COFFEE_FILES = $(shell find src -name '*.coffee' -print)
COFFEE_FILES_IN_LIB := $(shell find src -name '*.coffee' -print | sed s'/src\/\(.*\.coffee\)/lib\/\1/')

all: lib browser

clean:
	rm -rf lib
	rm -rf browser

bin:
	mkdir -p bin

lib: $(JS_FILES) $(COFFEE_FILES)
	rm -rf lib
	cp -r src/ lib/
	coffee -o lib src
	rm -f $(COFFEE_FILES_IN_LIB)

browser: browser/dynamics-2d.js

browser/dynamics-2d.js: lib
	mkdir -p browser
	$(BROWSERIFY) lib/model.js -o browser/dynamics-2d.js

hint:
	$(JSHINT) $(JS_FILES) --config jshint-config.json --show-non-errors

package: bin lib browser
	rm -rf dist
	mkdir dist
	cp -R bin/ dist/bin
	cp -r lib/ dist/lib
	cp -r browser/ dist/browser/
