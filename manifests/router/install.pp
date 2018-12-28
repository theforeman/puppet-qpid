# Installs Qpid router packages
#
# @api private
class qpid::router::install {
  package { $qpid::router::router_packages:
    ensure => 'installed',
  }
}
