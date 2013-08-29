# == Class: ruby::libraries::rake
#
# This class installs Rake.
#
class ruby::libraries::rake {
    require ruby

    package { 'rake':
        ensure => present,
        provider => gem
    }
}
