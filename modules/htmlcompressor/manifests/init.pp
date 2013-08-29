# == Class: htmlcompressor
#
# This class installs HtmlCompressor.
#
# === Dependencies
#
# * YUI Compressor
# * Closure Compiler
# * curl
#
class htmlcompressor {
    Exec {
        path => ['/bin/', '/sbin/', '/usr/bin/', '/usr/sbin/']
    }

    file { '/usr/local/htmlcompressor':
        ensure => directory
    }

    exec { 'install_htmlcompressor':
        command => 'curl -o htmlcompressor.jar \
            https://htmlcompressor.googlecode.com/files/htmlcompressor-1.5.3.jar',
        cwd => '/usr/local/htmlcompressor',
        creates => '/usr/local/htmlcompressor/htmlcompressor.jar'
    }

    exec { 'set_htmlcompressor_permissions':
        command => 'chmod 755 /usr/local/htmlcompressor/htmlcompressor.jar',
        require => Exec['install_htmlcompressor']
    }

    file { '/usr/local/bin/htmlcompressor':
        ensure => file,
        source => 'puppet:///modules/htmlcompressor/htmlcompressor'
    }

    file { '/usr/local/htmlcompressor/yuicompressor.jar':
        ensure => link,
        target => '/usr/local/yuicompressor/yuicompressor.jar',
        require => File['/usr/local/htmlcompressor']
    }

    file { '/usr/local/htmlcompressor/compiler.jar':
        ensure => link,
        target => '/usr/local/closure-compiler/compiler.jar',
        require => File['/usr/local/htmlcompressor']
    }
}
