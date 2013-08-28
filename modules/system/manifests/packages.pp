class system::packages {
    exec { 'apt-update':
        command => '/usr/bin/apt-get update'
    }
    Exec['apt-update'] -> Package<| |>

    package { 'curl':
        ensure => present
    }
    package { 'git':
        ensure => present
    }
    package { 'make':
        ensure => present
    }
}
