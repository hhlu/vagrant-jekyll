class ruby::packages::jekyll {
    require ruby

    package { 'jekyll':
        ensure => present,
        provider => gem
    }
}
