class python {
    package { 'python':
        ensure => present
    }
    package { 'python-pip':
        ensure => present,
        require => Package['python']
    }
}
