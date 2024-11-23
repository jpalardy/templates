
open: colored.png clean
	open $<

colored.png: colored.dot
	neato -T png -o $@ $^

colored.dot: formula.tsv installed.tsv
	awk 'ARGIND == 1 {lut[$$0]; next} ($$1 in lut) { print $$1; for(i=2; i<=NF; i++) { print $$1, $$i } }' installed.tsv formula.tsv > revised.tsv
	awk '{ for(i=2; i<=NF; i++) { if (!seen[$$i]++) { print $$i } } }' revised.tsv | sort > dependencies.tsv
	dotify revised.tsv > revised.dot
	awk 'ARGIND == 1 {lut[$$0]; next} match($$0, /^  "([^"]+)";$$/, arr) && !(arr[1] in lut) { sub(/;/, " [fontcolor=\"white\", fillcolor=\"#ff5555\"];") } { print }' dependencies.tsv revised.dot > $@

installed.tsv:
	brew ls --formula -1 > $@

formula.tsv: formula.json
	jq '.[] | [.name, (.dependencies | join(" "))] | @tsv' -r $< > $@

formula.json:
	curl -O https://formulae.brew.sh/api/formula.json

clean:
	rm -rf *.dot *.tsv

purge: clean
	rm -rf *.png *.json

