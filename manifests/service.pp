# Handles Qpid service
#
# @api private
class qpid::service {

  service { 'qpidd':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }

  if $facts['systemd'] {
    if $qpid::open_file_limit {
      $ensure_limit = 'present'
      $limits = {'LimitNOFILE' => $qpid::open_file_limit}
    } else {
      $ensure_limit = 'absent'
      $limits = {'LimitNOFILE' => 1} # https://github.com/camptocamp/puppet-systemd/pull/80
    }

    systemd::service_limits { 'qpidd.service':
      ensure          => $ensure_limit,
      restart_service => false,
      limits          => $limits,
      notify          => Service['qpidd'],
    }

    systemd::dropin_file { 'wait-for-port.conf':
      ensure  => bool2str($qpid::ssl, 'present', 'absent'),
      unit    => 'qpidd.service',
      content => template('qpid/wait-for-port.conf.erb'),
      notify  => Service['qpidd'],
    }
  }
}
