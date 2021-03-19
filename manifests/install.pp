# Handles Qpid install
#
# @api private
class qpid::install {
  include qpid::tools

  package { $qpid::server_packages:
    ensure => $qpid::version,
    before => Class['qpid::tools'],
  }

  if $qpid::auth {
    ensure_packages(['cyrus-sasl-plain'])
  }

  if $qpid::server_store {
    package { $qpid::server_store_package:
      ensure => $qpid::version,
      before => Class['qpid::tools'],
    }
  }
}
