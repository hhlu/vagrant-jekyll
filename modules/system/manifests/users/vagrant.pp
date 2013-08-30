# == Class: system:users::vagrant
#
# This class configures the vagrant user.
#
class system::users::vagrant {
    user { 'vagrant':
        ensure => present,
        managehome => true,
        groups => 'sudo'
    }

    file { '/home/vagrant/.bash_profile':
        ensure => file,
        mode => 0644,
        source => 'puppet:///modules/system/users/bash_profile',
        require => User['vagrant']
    }
}
