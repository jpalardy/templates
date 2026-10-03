
.PHONY: process
process: data.tsv

.PHONY: clean
clean:
	rm -rf data.tsv

data.tsv: raw/books.json Makefile
	jq '.[] | [.asin, .status] | @tsv' -r $< > $@

raw/books.json: Makefile
	scripts/fetch-data > $@

