DESTDIR=dist

install:
	mkdir -p $(DESTDIR)/opt/node-demo-app
	npm install
	cp -r node_modules/ *.js *.json $(DESTDIR)/opt/node-demo-app
	mkdir -p $(DESTDIR)/lib/systemd/system/
	cp init/node-demo-app.service $(DESTDIR)/lib/systemd/system/node-demo-app.service

clean:
	rm -rf node_modules/
