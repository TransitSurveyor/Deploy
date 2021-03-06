#!/bin/bash
set -e

# install puppet
apt-get update
apt-get install -y puppet

# install required puppet modules
puppet module install puppetlabs-stdlib
puppet module install puppetlabs-postgresql
puppet module install puppetlabs-vcsrepo

# disable password logins
sed -i "s/#PasswordAuthentication yes/PasswordAuthentication no/" /etc/ssh/sshd_config
echo "export EDITOR=/usr/bin/vim" >> /etc/environment

service ssh restart

# copy local modules into puppet modules
cp -r /vagrant/puppet/modules/* /etc/puppet/modules

# apply puppet configuration locally
puppet apply /vagrant/puppet/setup.pp

# build database
/vagrant/scripts/build_db.sh

service uwsgi start
