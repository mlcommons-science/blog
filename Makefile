all:
	npx @11ty/eleventy
	cp -r _site docs
