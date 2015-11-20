class users {
    
    group { 'survey':
        ensure => present,
    }

    user { 'api-user':
        require     => Group['survey'],
        ensure      => present,
        groups      => ['survey'],
        managehome  => true,
        shell       => "/bin/bash",
    }
}
