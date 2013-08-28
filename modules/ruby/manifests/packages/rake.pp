class ruby::packages::rake {
    require ruby

    package { 'rake':
        ensure => present,
        provider => gem
    }
}
