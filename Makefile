default: devel test

devel: bin/buildout buildout-cache/downloads
	bin/buildout -c devel.cfg -N -t 3

travis: saucelabs travis_build

travis_build: bin/buildout buildout-cache/downloads
	bin/buildout -c buildout.cfg -N -t 3

test:
	bin/test -s plonesocial.suite
	bin/flake8 src/plonesocial

saucelabs:
	curl -O http://saucelabs.com/downloads/Sauce-Connect-latest.zip
	unzip Sauce-Connect-latest.zip
	java -jar Sauce-Connect.jar $$SAUCE_USERNAME $$SAUCE_ACCESS_KEY -i $$TRAVIS_JOB_ID -f CONNECTED &
	JAVA_PID=$$!

predepends:
	sudo apt-get install -y firefox

bin/buildout: bin/python
	bin/easy_install zc.buildout==1.6.3
	bin/easy_install distribute==0.6.28

bin/python:
	virtualenv --clear --no-site-packages --distribute .

buildout-cache/downloads:
	[ -d buildout-cache ] || mkdir -p buildout-cache/downloads

clean:
	rm -rf bin/* .installed.cfg parts/download

# robot development: start server first
## bin/robot-server plonesocial.suite.testing.PLONESOCIAL_ROBOT_TESTING
# run and rerun tests without restarting the server
## bin/robot src/plonesocial/suite/tests/hello_world.robot 