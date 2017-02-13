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

  if($::qpid::router::open_file_limit and $::systemd) {
    systemd::service_limits { 'qdrouterd.service':
      limits  => {
        'LimitNOFILE' => $::qpid::router::open_file_limit,
      },
      require => Service['qdrouterd'],
    }
  }
}
