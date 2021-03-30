# Default router parameter values
#
# @api private
class qpid::router::params {
  $router_id           = $facts['networking']['fqdn']
  $worker_threads      = $facts['processors']['count']
}
