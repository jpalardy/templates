
ELM_FILES = $(wildcard src/*.elm)

public/js/app.js: $(ELM_FILES)
	elm make $^ --output $@

watch:
	ls $(ELM_FILES) | entr -c -s 'make -s; ding'

clean:
	rm -rf public/js/app.js elm-stuff/

