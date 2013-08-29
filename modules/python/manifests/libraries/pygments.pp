# == Class: python::libraries::pygments
#
# This class installs Pygments.
#
class python::libraries::pygments {
    require python

    package { 'pygments':
        ensure => present,
        provider => pip
    }
}
