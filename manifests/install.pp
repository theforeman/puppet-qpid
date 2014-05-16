# == Class: qpid::install
#
# Handles Qpid install
#
class qpid::install {

  $packages_to_install = ['qpid-cpp-server',
                          'qpid-cpp-client',
                          'python-qpid-qmf',
                          'python-qpid',
                          'policycoreutils-python',
                          'qpid-tools',
                          'qpid-cpp-server-store'
                          ]

  package { $packages_to_install:
    ensure => 'installed',
    before => Service['qpidd']
  }

}
