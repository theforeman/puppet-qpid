# == Class: qpid::config
#
# Handles Qpid configuration
#
class qpid::config
{

  group { $qpid::group:
    ensure => present,
  }

  user { $qpid::user:
    ensure => present,
    groups => $qpid::user_groups,
  }

  file { $qpid::config_file:
    ensure  => file,
    content => template('qpid/qpidd.conf.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

  if $qpid::acl_content {
    $acl_file_ensure = file
  } else {
    $acl_file_ensure = absent
  }

  file { $qpid::acl_file:
    ensure  => $acl_file_ensure,
    owner   => 'root',
    group   => 'qpidd',
    mode    => '0640',
    content => $qpid::acl_content,
  }
}
