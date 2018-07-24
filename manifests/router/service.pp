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

  if $::qpid::router::open_file_limit != 1 {
    $ensure_limit = 'present'
  } else {
    $ensure_limit = 'absent'
  }

  if $::systemd {
    systemd::service_limits { 'qdrouterd.service':
      ensure          => $ensure_limit,
      restart_service => false,
      notify          => Service['qdrouterd'],
      limits          => {
        'LimitNOFILE' => $::qpid::router::open_file_limit,
      },
    }
  }
}
