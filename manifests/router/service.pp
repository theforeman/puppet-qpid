# == Class: qpid::router::service
#
# Handles Qpid Dispatch Router service
#
class qpid::router::service {

  service { 'qdrouterd':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }

  if $::service_provider == 'systemd' {
    if $::qpid::router::open_file_limit {
      $ensure_limit = 'present'
      $limits = {'LimitNOFILE' => $::qpid::router::open_file_limit}
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
