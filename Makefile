build:
	mkdir -p lib
	rm -rf lib/*
	node_modules/.bin/coffee --compile -m --output lib/ src/

watch:
	node_modules/.bin/coffee --watch --compile --output lib/ src/
	
test:
	node_modules/.bin/mocha

jumpstart:
	mkdir -p src
	touch src/call-delayed.coffee
	mkdir -p test
	touch test/call-delayed.coffee
	npm install

.PHONY: test
