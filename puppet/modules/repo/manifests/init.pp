class repo {

    $GIT_API = 'https://github.com/TransitSurveyor/API.git'
    $GIT_DATA = 'https://github.com/TransitSurveyor/Data.git'

    package { 'git': }

    vcsrepo { '/vagrant/api':
        require     => Package['git'],
        ensure      => present,
        provider    => git,
        source      => $GIT_API,
        revision    => 'trimet_working',
    }

    vcsrepo { '/vagrant/data':
        require     => Package['git'],
        ensure      => present,
        provider    => git,
        source      => $GIT_DATA,
        revision    => 'trimet_working',
    }

    file { '/var/www': 
        require     => Vcsrepo['/vagrant/api'],
        ensure      => 'directory',
        owner       => www-data,
        group       => www-data,
    }

    file { '/var/www/api': 
        require     => File['/var/www'],
        ensure      => link,
        target      => '/vagrant/api',
        owner       => www-data,
        group       => www-data,
    }
}
