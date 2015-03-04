virtualenv --no-setuptools .
mkdir -p buildout-cache/downloads
./bin/pip install -r requirements.txt
./bin/buildout
./bin/develop up -f
# Xvfb :99 -a &
