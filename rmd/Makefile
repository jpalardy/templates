
RMDs = $(wildcard *.Rmd)
HTMLs = $(RMDs:.Rmd=.html)

TSVs = $(wildcard *.tsv)

# -------------------------------------------------

.PHONY: build
build: $(HTMLs)

.PHONY: clean
clean:
	rm -f report.html

# -------------------------------------------------

%.html: %.Rmd $(TSVs)
	R --vanilla --quiet -e 'rmarkdown::render("$<")'

