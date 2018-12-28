# Handles Qpid configuration
#
# @api private
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
}
