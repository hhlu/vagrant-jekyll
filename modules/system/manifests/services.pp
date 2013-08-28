class system::services {
    exec { 'ufw-disable':
        command => '/usr/sbin/ufw disable'
    }
}
