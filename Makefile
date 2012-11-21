# convenience makefile to boostrap & run buildout
# use `make options=-v` to run buildout with extra options

options = -N -q -t 3

default: prerequisites install test

prerequisites:
	sudo apt-get install -qq pep8 pyflakes
	mkdir -p buildout-cache/downloads

install: prerequisites
	python bootstrap.py -c travis.cfg
	bin/buildout -c travis.cfg $(options)

test:
	bin/test -s plonesocial.suite -s plonesocial.microblog -s plonesocial.activitystream -s plonesocial.network
	pyflakes src/plonesocial/suite
	pep8 src/plonesocial/suite
