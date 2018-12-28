# Default router parameter values
#
# @api private
class qpid::router::params {
  $config_file         = '/etc/qpid-dispatch/qdrouterd.conf'
  $router_id           = $facts['fqdn']
  $router_mode         = 'interior'
  $worker_threads      = $facts['processorcount']
  $router_packages     = ['qpid-dispatch-router']
  $open_file_limit     = undef
  $hello_max_age       = undef
  $hello_interval      = undef
}
