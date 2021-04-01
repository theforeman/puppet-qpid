# Handles Qpid install
#
# @api private
class qpid::install {

  if $qpid::ensure == 'absent' {
    $_package_ensure = 'purged'
  } else {
    $_package_ensure = $qpid::version
  }

  package { $qpid::server_packages:
    ensure => $_package_ensure,
  }

  if $qpid::auth {
    ensure_packages(['cyrus-sasl-plain'], {ensure => $_package_ensure})
  }

  if $qpid::server_store {
    package { $qpid::server_store_package:
      ensure => $_package_ensure,
    }
  }
}
