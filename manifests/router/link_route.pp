# Configure a link route
#
# @param direction
#   Direction when using asymmetric routing
# @param prefix
#   Prefix to use
# @param connection
#   Connector for this link route pattern
define qpid::router::link_route(
  Enum['in', 'out'] $direction,
  String $prefix = 'queue.',
  Optional[String] $connection = undef,
  String $config_file = $qpid::router::config_file,
){

  concat::fragment {"qdrouter+link_route_${name}.conf":
    target  => $config_file,
    content => template('qpid/router/link_route.conf.erb'),
    order   => '04',
  }

}
