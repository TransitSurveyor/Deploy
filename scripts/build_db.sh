#!/bin/bash
set -e

# build onoff postgres database
puppet apply /vagrant/puppet/onoff.pp

# enable postgis
su -c "psql -c \"create extension postgis;\" -d onoff" postgres

# build sql file to load stops into database
/vagrant/data/build_data_inputs.sh

# load schema
su -c "psql -f /vagrant/data/data/schema.sql -d onoff" postgres

# load stops
su -c "psql -f /vagrant/data/output_api/stops.sql -d onoff" postgres

puppet apply /vagrant/puppet/permissions.pp

# insert test user
# /vagrant/api/add_user.sh db db_user username password
/vagrant/api/add_user.sh onoff onoff testuser 1234

