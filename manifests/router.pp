# Handles Qpid dispatch router package installations and configuration
#
# @param router_id
#   Unique router ID
# @param mode
#   Router mode
# @param config_file
#   Dispatch router config file location
# @param router_packages
#   The package to be installed
# @param open_file_limit
#   Limit number of open files - systemd distros only
# @param worker_threads
#   Number of worker threads
# @param hello_interval
#   Frequency in seconds of sending heartbeats from this router
# @param hello_max_age
#   Timeout of heartbeat before connections are dropped
# @param service_enable
#   Enable/disable qdrouterd service at boot
# @param service_ensure
#   Specify if qdrouterd should be running or stopped.
class qpid::router(
  $router_id               = $qpid::router::params::router_id,
  $mode                    = $qpid::router::params::router_mode,
  $config_file             = $qpid::router::params::config_file,
  $router_packages         = $qpid::router::params::router_packages,
  $open_file_limit         = $qpid::router::params::open_file_limit,
  $worker_threads          = $qpid::router::params::worker_threads,
  $hello_interval          = $qpid::router::params::hello_interval,
  $hello_max_age           = $qpid::router::params::hello_max_age,
  $service_ensure          = true,
  $service_enable          = undef,
) inherits qpid::router::params {

  contain qpid::router::install
  contain qpid::router::config
  contain qpid::router::service

  Class['qpid::router::install'] -> Class['qpid::router::config'] ~> Class['qpid::router::service']

}
