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

  if $::qpid::open_file_limit and $::systemd {
    systemd::service_limits { 'qpidd.service':
      limits  => {
        'LimitNOFILE' => $::qpid::open_file_limit,
      },
      notify  => Service['qpidd'],
    }
  }
}
