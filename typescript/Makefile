
.PHONY: bootstrap
bootstrap:
	mise use node
	npm install -g typescript-language-server
	npm install typescript prettier

.PHONY: watch
watch:
	npm exec -- tsc --watch

.PHONY: compile
compile:
	npm exec -- tsc

.PHONY: clean
clean:
	rm -rf dist

.PHONY: purge
purge: clean
	rm -rf node_modules

