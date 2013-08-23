CHECK=\033[32m✔\033[39m

help:
	@echo "\033]0;bootstrap-windows\007"
	@echo "\n\033[1m------ Bootstrap Windows ------\033[0m \n\
	Commands: open, setup, test, build, watch, amazon, tag, deploy\n\n\
	\033[1mopen\033[0m: opens project in sublime\n\
	\033[1msetup\033[0m: installs npm and bower dependancies\n\
	\033[1mbuild\033[0m: runs grunt to build the project\n\
	\033[1mamazon\033[0m: deploys to amazon\n\
	\033[1mdeploy\033[0m: tag amazon\n\
	\033[1mwatch\033[0m: watches for changes then builds\n\n\
	\t \033[94mhttps://github.com/stevepeak/bootstrap-windows\033[0m\n\
	\t\t\033[91mHappy Hacking\033[0m\n"

open:
	subl --project ./project.sublime-project

build:
	grunt

watch:
	@echo "\033]0;bootstrap-windows • make watch\007"
	grunt watch

amazon:
	mkdir deploy
	cp bootstrap-windows.js deploy/bootstap-windows-$(shell python -c "import json;f=open('package.json');print(json.load(f)['version']);f.close();").js
	cp bootstrap-windows.min.js deploy/bootstap-windows-$(shell python -c "import json;f=open('package.json');print(json.load(f)['version']);f.close();").min.js
	cp bootstrap-windows.min.css deploy/bootstap-windows-$(shell python -c "import json;f=open('package.json');print(json.load(f)['version']);f.close();").min.css
	cp bootstrap-windows.js deploy/bootstap-windows.latest.js
	cp bootstrap-windows.min.js deploy/bootstap-windows.latest.min.js
	cp bootstrap-windows.min.css deploy/bootstap-windows.latest.min.css
	s3cmd sync deploy/* \
		--add-header=Expires:max-age=604800 \
		--acl-public \
		s3://iopeak/lib/boostrap-windows/
	rm -rf deploy

tag:
	git tag -m "" -a v$(shell python -c "import json;f=open('package.json');print(json.load(f)['version']);f.close();")
	git push origin v$(shell python -c "import json;f=open('package.json');print(json.load(f)['version']);f.close();")

deploy: build tag amazon
