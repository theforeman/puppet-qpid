# == Class: qpid::router::params
#
# Default parameter values
#
class qpid::router::params {
  $config_file         = '/etc/qpid-dispatch/qdrouterd.conf'
  $router_id           = $::fqdn
  $router_mode         = 'interior'
  $worker_threads      = $::processorcount
  $router_packages     = ['qpid-dispatch-router']
  $open_file_limit     = 1 # 1 is used to denote absent condition due to how systemd::service_limits works
}
