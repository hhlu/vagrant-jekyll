# == Class: python
#
# This class installs Python.
#
class python {
    package { 'python':
        ensure => present
    }
    package { 'python-pip':
        ensure => present,
        require => Package['python']
    }
}
