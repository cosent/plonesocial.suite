PROJECT=plonesocial.suite

default: devel

docker-build:
	docker build -t $(PROJECT) .

# re-uses ssh agent
# presupposes your buildout cache is in /var/tmp as configured in .buildout
# also loads your standard .bashrc
docker-run:
	docker run -i -t \
		--net=host \
		-v $(SSH_AUTH_SOCK):/tmp/auth.sock \
		-v $(HOME)/.gitconfig:/.gitconfig \
		-v $(HOME)/.gitignore:/.gitignore \
		-v /var/tmp:/var/tmp \
		-v $(HOME)/.bashrc:/.bashrc \
		-v $(HOME)/.buildout:/.buildout \
		-e SSH_AUTH_SOCK=/tmp/auth.sock \
		-v $(PWD):/app -w /app -u app $(PROJECT)

devel: bin/buildout
	[ -f bin/develop ] && bin/develop up || true
	bin/buildout -c devel.cfg


test:
	Xvfb :97 1>/dev/null 2>&1 & HOME=/app DISPLAY=:97 bin/test -s plonesocial.suite

demo:
	HOME=/app DISPLAY=:0 bin/test -s plonesocial.suite -t demo --all

travis-test:
	bin/test -s plonesocial.suite
	bin/flake8 src/plonesocial

travis: install_saucelabs travis_build

travis_build: bin/buildout buildout-cache/downloads
	bin/buildout -c travis.cfg

install_saucelabs:
	curl -O http://saucelabs.com/downloads/Sauce-Connect-latest.zip
	unzip Sauce-Connect-latest.zip
	java -jar Sauce-Connect.jar $$SAUCE_USERNAME $$SAUCE_ACCESS_KEY -i $$TRAVIS_JOB_ID -f CONNECTED &
	JAVA_PID=$$!
	bash -c "while [ ! -f CONNECTED ]; do sleep 2; done"

# for manual runs
robot-server:
	bin/robot-server plonesocial.suite.testing.PLONESOCIAL_ROBOT_TESTING

predepends:
	sudo apt-get install -y firefox python-tk

### helper targets ###

bin/buildout: bin/python2.7
	@bin/pip install -r requirements.txt

bin/python2.7:
	@virtualenv --clear --no-site-packages .

buildout-cache/downloads:
	[ -d buildout-cache ] || mkdir -p buildout-cache/downloads

clean:
	rm -rf bin/* .installed.cfg parts/download lib/*

# robot development: start server first
## bin/robot-server plonesocial.suite.testing.PLONESOCIAL_ROBOT_TESTING
# run and rerun tests without restarting the server
## bin/robot src/plonesocial/suite/tests/hello_world.robot 

## tired of the robot hijacking your screen?
# sudo apt-get install xserver-xephyr
# Xephyr :1 -ac -screen 1024x768 &
# DISPLAY=:1 bin/test -s plonesocial.suite
