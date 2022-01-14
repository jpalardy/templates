
ELMs = $(wildcard src/*.elm)
OUTPUT = public/js/app.js

# -------------------------------------------------

.PHONY: build
build: $(OUTPUT)

.PHONY: watch
watch:
	ls $(ELMs) | entr -c -s 'make -s; ding'

.PHONY: clean
clean:
	rm -rf elm-stuff/ $(OUTPUT)

# -------------------------------------------------

$(OUTPUT): $(ELMs)
	elm make $^ --output $@

