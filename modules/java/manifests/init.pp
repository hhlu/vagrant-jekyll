# == Class: java
#
# This class installs JRE and JDK.
#
class java {
    package { 'openjdk-7-jre':
        ensure => present
    }
    package { 'openjdk-7-jdk':
        ensure => present,
        require => Package['openjdk-7-jre']
    }
}
