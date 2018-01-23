# == Class: qpid::router
#
# Handles Qpid dispatch router package installations and configuration
#
#
# == Parameters
#
# $router_id::       Unique router ID
#
# $mode::            Router mode
#
# $config_file::     Dispatch router config file location
#
# $open_file_limit:: Limit number of open files - systemd distros only
#
# $router_packages:: The package to be installed
#
# $worker_threads::  Number of worker threads
#
class qpid::router(
  $router_id               = $qpid::router::params::router_id,
  $mode                    = $qpid::router::params::router_mode,
  $config_file             = $qpid::router::params::config_file,
  $router_packages         = $qpid::router::params::router_packages,
  $open_file_limit         = $qpid::router::params::open_file_limit,
  $worker_threads          = $qpid::router::params::worker_threads,
) inherits qpid::router::params {

  contain ::qpid::router::install
  contain ::qpid::router::config
  contain ::qpid::router::service

  Class['qpid::router::install'] -> Class['qpid::router::config'] ~> Class['qpid::router::service']

}
