class python::packages::pygments {
    require python

    package { 'pygments':
        ensure => present,
        provider => pip
    }
}
