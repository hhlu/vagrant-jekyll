# == Class: closure_compiler
#
# This class installs Closure Compiler.
#
# === Dependencies
#
# * curl
# * tar
#
class closure_compiler {
    Exec {
        path => ['/bin/', '/sbin/', '/usr/bin/', '/usr/sbin/']
    }

    exec { 'download_closure_compiler':
        command => 'curl -o compiler-latest.tar.gz \
            http://dl.google.com/closure-compiler/compiler-latest.tar.gz',
        cwd => '/usr/local/src',
        creates => '/usr/local/src/compiler-latest.tar.gz'
    }

    file { '/usr/local/closure-compiler':
        ensure => directory
    }

    exec { 'install_closure_compiler':
        command => 'tar -xzf /usr/local/src/compiler-latest.tar.gz -C /usr/local/closure-compiler',
        creates => '/usr/local/closure-compiler/compiler.jar',
        require => [Exec['download_closure_compiler'], File['/usr/local/closure-compiler']]
    }

    exec { 'set_closure_compiler_permissions':
        command => 'chmod 755 /usr/local/closure-compiler/compiler.jar',
        require => Exec['install_closure_compiler']
    }

    file { '/usr/local/bin/closure':
        ensure => file,
        source => 'puppet:///modules/closure_compiler/closure'
    }
}
