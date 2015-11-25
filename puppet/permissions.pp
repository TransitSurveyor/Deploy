class { 'postgresql::server': }

postgresql::server::database_grant { 'onoff':
    privilege => 'ALL',
    db        => 'onoff',
    role      => 'onoff',
}

postgresql::server::grant { 'tables':
  privilege     => 'ALL',
  object_name   => 'public',
  object_type   => 'ALL TABLES IN SCHEMA',
  db            => 'onoff',
  role          => 'onoff',
}

postgresql::server::grant { 'sequences':
  privilege     => 'ALL',
  object_name   => 'public',
  object_type   => 'ALL SEQUENCES IN SCHEMA',
  db            => 'onoff',
  role          => 'onoff',
}
