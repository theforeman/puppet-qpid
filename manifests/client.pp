# == Class: qpid::client
#
# Handles Qpid client configuration
#
class qpid::client {

  package { ['qpid-cpp-client-devel']:
    ensure => 'installed'
  }

  file { '/etc/qpid/qpidc.conf':
    ensure  => file,
    content => template('qpid/qpidc.conf.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

  file { '/etc/qpidc.conf':
    ensure  => link,
    target  => '/etc/qpid/qpidc.conf',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

}
