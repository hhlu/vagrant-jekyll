class yui_compressor {
    require java

    Exec {
        path => ['/bin/', '/sbin/', '/usr/bin/', '/usr/sbin/']
    }

    exec { 'clone_yui_compressor':
        command => 'git clone https://github.com/yui/yuicompressor.git yuicompressor',
        cwd => '/usr/local/src',
        creates => '/usr/local/src/yuicompressor/src/com/yahoo/platform/yui/compressor'
    }

    exec { 'build_yui_compressor':
        command => 'ant -Dbuild.dir=/usr/local/yuicompressor',
        cwd => '/usr/local/src/yuicompressor',
        creates => '/usr/local/yuicompressor/yuicompressor-2.4.8.jar'
    }

    exec { 'set_yui_compressor_permissions':
        command => 'chmod 755 /usr/local/yuicompressor/yuicompressor-2.4.8.jar',
        require => Exec['build_yui_compressor']
    }

    file { '/usr/local/bin/yui':
        ensure => file,
        source => 'puppet:///modules/yui_compressor/yui'
    }
}
