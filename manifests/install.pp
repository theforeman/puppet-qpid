# == Class: qpid::install
#
# Handles Qpid install
#
class qpid::install {

  package { $qpid::packages_to_install:
    ensure => 'installed',
    before => Service['qpidd']
  }

}
