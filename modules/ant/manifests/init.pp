# == Class: ant
#
# This class installs Apache Ant.
#
# === Dependencies
#
# * JDK >= 1.4
#
class ant {
    package { 'ant':
        ensure => present
    }
}
