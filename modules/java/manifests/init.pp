class java {
    package { 'openjdk-7-jdk':
        ensure => present
    }
    package { 'ant':
        ensure => present
    }
}
