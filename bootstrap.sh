#!/usr/bin/env bash
# Part of Vagrant virtual environments for https://public-inbox.org
export DEBIAN_FRONTEND="noninteractive"
sudo apt-get  -y -qq remove --purge postfix
sudo apt-get -y -qq autoremove
sudo apt-get -y -qq update
sudo apt-get -y -qq upgrade
sudo apt-get -y -qq install \
  libdbd-sqlite3-perl \
  libdbi-perl \
  libemail-mime-contenttype-perl \
  libemail-mime-perl \
  libencode-perl \
  libplack-perl \
  libsearch-xapian-perl \
  libtimedate-perl \
  liburi-perl
git clone https://public-inbox.org/ public-inbox
cd public-inbox
perl Makefile.PL
make
sudo make install