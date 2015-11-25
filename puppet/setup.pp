include users
include repo
include nginx
include python
include uwsgi

class { 'postgresql::server': }

class {'postgresql::server::postgis': }
