# == Class: qpid::service
#
# Handles Qpid service
#
class qpid::service {

  service { 'qpidd':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }

  if $::qpid::open_file_limit != 1 {
    $ensure_limit = 'present'
  } else {
    $ensure_limit = 'absent'
  }

  if $::systemd {
    systemd::service_limits { 'qpidd.service':
      ensure          => $ensure_limit,
      restart_service => false,
      notify          => Service['qpidd'],
      limits          => {
        'LimitNOFILE' => $::qpid::open_file_limit,
      },
    }
  }
}
