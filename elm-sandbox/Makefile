
OUTPUT = public/js/app.js
# --debug, probably
FLAGS ?=

# -------------------------------------------------

.PHONY: optimize
optimize:
	make build FLAGS=--optimize
	npm exec -- uglifyjs $(OUTPUT) --compress 'pure_funcs=[F2,F3,F4,F5,F6,F7,F8,F9,A2,A3,A4,A5,A6,A7,A8,A9],pure_getters,keep_fargs=false,unsafe_comps,unsafe' | npm exec -- uglifyjs --mangle --output $(OUTPUT)

.PHONY: build
build: node_modules
	npm exec -- elm make src/Main.elm $(FLAGS) --output $(OUTPUT)

node_modules:
	npm install

.PHONY: watch
watch:
	ls $(wildcard **/*.elm) | entr -c -s 'ding make -s build'

.PHONY: test
test: node_modules
	npm exec -- elm-test

# -------------------------------------------------

.PHONY: clean
clean:
	rm -rf elm-stuff/ $(OUTPUT)

.PHONY: purge
purge: clean
	rm -rf node_modules/

