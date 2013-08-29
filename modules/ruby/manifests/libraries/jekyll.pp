# == Class: ruby::libraries::jekyll
#
# This class installs Jekyll.
#
# === Dependencies
#
# * make
#
class ruby::libraries::jekyll {
    require ruby

    package { 'jekyll':
        ensure => present,
        provider => gem
    }
}
