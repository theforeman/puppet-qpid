# == Define: qpid::router::link_route
#
# Configure a link route
#
# == Parameters
#
# $prefix::      Prefix to use
#
# $direction::   Direction when using asymmetric routing
#
# $connection::  Connector for this link route
#
define qpid::router::link_route (
  $prefix     = 'queue.',
  $direction  = undef,
  $connection = undef,
){

  concat::fragment {"qdrouter+link_route_${name}.conf":
    target  => $qpid::router::config_file,
    content => template('qpid/router/link_route.conf.erb'),
    order   => '04',
  }

}
