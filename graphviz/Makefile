
graph.png: graph.dot Makefile
	dot -Tpng $< -o $@

.PHONY: watch
watch:
	echo graph.dot | entr make

.PHONY: clean
clean:
	rm -f graph.png

