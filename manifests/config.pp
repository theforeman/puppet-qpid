# Handles Qpid configuration
#
# @api private
class qpid::config
{

  user { $qpid::user:
    ensure => $qpid::ensure,
    groups => $qpid::user_groups,
  } ~>
  group { $qpid::group:
    ensure => $qpid::ensure,
  }

  file { $qpid::config_file:
    ensure  => $qpid::ensure,
    content => template('qpid/qpidd.conf.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

  if $qpid::acl_content and $qpid::ensure == 'present' {
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
