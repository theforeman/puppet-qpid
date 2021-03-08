# Handles Qpid Dispatch Router service
#
# @api private
class qpid::router::service {

  service { 'qdrouterd':
    ensure     => $qpid::router::service_ensure,
    enable     => pick($qpid::router::service_enable, $qpid::router::service_ensure),
    hasstatus  => true,
    hasrestart => true,
  }

  if $facts['systemd'] {
    if $qpid::router::open_file_limit {
      $ensure_limit = 'present'
      $limits = {'LimitNOFILE' => $qpid::router::open_file_limit}
    } else {
      $ensure_limit = 'absent'
      $limits = {'LimitNOFILE' => 1} # https://github.com/camptocamp/puppet-systemd/pull/80
    }

    systemd::service_limits { 'qdrouterd.service':
      ensure          => $ensure_limit,
      restart_service => false,
      limits          => $limits,
      notify          => Service['qdrouterd'],
    }
  }
}
