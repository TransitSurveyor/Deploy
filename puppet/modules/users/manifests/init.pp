class users {
    
    group { 'survey':
        ensure      => present,
    }

    user { 'onoff':
        require     => Group['survey'],
        ensure      => present,
        groups      => ['survey'],
        managehome  => true,
        shell       => "/bin/bash",
        password    => pw_hash('onoff_password', 'SHA-512', 'salt'),
    }
}
