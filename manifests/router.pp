# == Class: qpid::router
#
# Handles Qpid dispatch router package installations and configuration
#
#
# == Parameters
#
# $router_id::       Unique router ID
#
# $container_name::  Unique container name
#
# $mode::            Router mode
#
# $config_file::     Dispatch router config file location
#
# $open_file_limit:: Limit number of open files - systemd distros only
#
class qpid::router(
  $router_id               = $qpid::router::params::router_id,
  $mode                    = $qpid::router::params::router_mode,
  $config_file             = $qpid::router::params::config_file,
  $container_name          = $qpid::router::params::container_name,
  $router_packages         = $qpid::router::params::router_packages,
  $open_file_limit         = $qpid::router::params::open_file_limit,
) inherits qpid::router::params {

  class { '::qpid::router::install': } ->
  class { '::qpid::router::config': } ~>
  class { '::qpid::router::service': }

}
