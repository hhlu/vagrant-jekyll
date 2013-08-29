# == Class: system:services
#
# This class manages system services.
#
class system::services {
    exec { 'ufw-disable':
        command => '/usr/sbin/ufw disable'
    }
}
