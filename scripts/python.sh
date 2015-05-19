#!/bin/sh

cd /tmp

wget https://www.python.org/ftp/python/2.7.8/Python-2.7.8.tgz
tar -zxvf Python-2.7.8.tgz
cd Python-2.7.8
./configure --prefix=/usr/local --enable-unicode=ucs4 --enable-shared LDFLAGS="-Wl,-rpath /usr/local/lib"
make && make altinstall

cd ..
wget --no-check-certificate https://pypi.python.org/packages/source/s/setuptools/setuptools-1.4.2.tar.gz
tar -xvf setuptools-1.4.2.tar.gz
cd setuptools-1.4.2
/usr/local/bin/python2.7 setup.py install

cd ..
wget https://raw.github.com/pypa/pip/master/contrib/get-pip.py
/usr/local/bin/python2.7 get-pip.py
