
DOTs = $(wildcard *.dot)
PNGs = $(DOTs:.dot=.png)

all: $(PNGs)

%.png: %.dot Makefile
	dot -Tpng $< -o $@

.PHONY: watch
watch:
	echo $(DOTs) | entr -c -s 'ding make'

.PHONY: clean
clean:
	rm -f *.png

