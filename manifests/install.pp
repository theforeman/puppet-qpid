# Handles Qpid install
#
# @api private
class qpid::install {

  include qpid::tools

  package { $qpid::server_packages:
    ensure => $qpid::version,
    before => [Service['qpidd'],Package['qpid-tools']],
  }

  if $qpid::server_store {
    package { $qpid::server_store_package:
      ensure => $qpid::version,
      before => [Service['qpidd'],Package['qpid-tools']],
    }
  }
}
