
RMDs = $(wildcard *.Rmd)
HTMLs = $(RMDs:.Rmd=.html)

# -------------------------------------------------

.PHONY: build
build: $(HTMLs)

.PHONY: clean
clean:
	rm -f report.html

# -------------------------------------------------

%.html: %.Rmd
	R --vanilla --quiet -e 'rmarkdown::render("$<")'

