class { 'postgresql::server': }

postgresql::server::db { 'onoff':
    user     => 'onoff',
    password => 'onoff_password',
}
