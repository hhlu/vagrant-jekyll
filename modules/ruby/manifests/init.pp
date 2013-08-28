class ruby {
    Exec {
        path => ['/bin/', '/sbin/', '/usr/bin/', '/usr/sbin/']
    }

    package { 'ruby1.9.1-dev':
        ensure => present
    }

    exec { 'update-alternatives-ruby':
        command => 'update-alternatives --set ruby /usr/bin/ruby1.9.1',
        unless => 'test /etc/alternatives/ruby -ef /usr/bin/ruby1.9.1',
        require => Package['ruby1.9.1-dev']
    }

    exec { 'update-alternatives-gem':
        command => 'update-alternatives --set gem /usr/bin/gem1.9.1',
        unless => 'test /etc/alternatives/gem -ef /usr/bin/gem1.9.1',
        require => Package['ruby1.9.1-dev']
    }
}
