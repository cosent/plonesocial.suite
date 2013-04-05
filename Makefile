default: buildout test

buildout: bin/buildout buildout-cache/downloads
	bin/buildout -c buildout.cfg -N -t 3

test:
	bin/test -s plonesocial.suite -s plonesocial.microblog -s plonesocial.activitystream -s plonesocial.network
	bin/flake8 src

bin/buildout: bin/python
	bin/easy_install zc.buildout==1.6.3
	bin/easy_install distribute==0.6.28

bin/python:
	virtualenv --clear --no-site-packages --distribute .

buildout-cache/downloads:
	[ -d buildout-cache ] || mkdir -p buildout-cache/downloads

clean:
	rm -rf bin/* .installed.cfg parts/download

