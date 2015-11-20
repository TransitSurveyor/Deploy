class python {
    
    include python::packages

    package { 'python':
        ensure => installed,
    }
}

class python::packages {
    
    $apt = [
        'python-dev',
        'build-essential',
        'python-pip',
        'postgresql-server-dev-9.3',
    ]
    
    $pip = [
        'flask',
	    'sqlalchemy',
        'flask-sqlalchemy',
        'geoalchemy2',
        'psycopg2',
        'requests',
    ]

    package { $apt:
        require => Class['python'],
        ensure => installed,
    }

    package { $pip:
        require => Package[$apt],
        ensure => installed,
        provider => pip,
    }
}
