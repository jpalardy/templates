
FORMAT ?= html

# -------------------------------------------------

.PHONY: render
render:
	quarto render --to $(FORMAT)

.PHONY: preview
preview:
	quarto preview *.qmd

.PHONY: clean
clean:
	rm -rf report.html report.pdf report_files/ .quarto/

