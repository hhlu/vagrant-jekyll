# == Class: yui_compressor
#
# This class installs YUI Compressor.
#
# === Dependencies
#
# * JDK >= 1.4
# * Apache Ant
# * git
#
class yui_compressor {
    Exec {
        path => ['/bin/', '/sbin/', '/usr/bin/', '/usr/sbin/']
    }

    exec { 'clone_yui_compressor':
        command => 'git clone https://github.com/yui/yuicompressor.git yuicompressor',
        cwd => '/usr/local/src',
        creates => '/usr/local/src/yuicompressor/src/com/yahoo/platform/yui/compressor'
    }

    file { '/usr/local/yuicompressor':
        ensure => directory
    }

    exec { 'build_yui_compressor':
        command => 'ant -Dbuild.dir=/usr/local/yuicompressor \
            -Djar.name=yuicompressor.jar',
        cwd => '/usr/local/src/yuicompressor',
        creates => '/usr/local/yuicompressor/yuicompressor.jar',
        require => [Exec['clone_yui_compressor'], File['/usr/local/yuicompressor']]
    }

    exec { 'set_yui_compressor_permissions':
        command => 'chmod 755 /usr/local/yuicompressor/yuicompressor.jar',
        require => Exec['build_yui_compressor']
    }

    file { '/usr/local/bin/yui':
        ensure => file,
        source => 'puppet:///modules/yui_compressor/yui'
    }
}
