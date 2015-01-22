# == Class: qpid::params
#
# Default parameter values
#
class qpid::params {

  $ssl      = false
  $ssl_port = 5671

  $user_groups = []

  $user = 'qpidd'
  $group = 'qpidd'

  $packages_to_install = ['qpid-cpp-server',
                          'qpid-cpp-client',
                          'python-qpid-qmf',
                          'python-qpid',
                          'policycoreutils-python',
                          'qpid-tools',
                          ]
}
