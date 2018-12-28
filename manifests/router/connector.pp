# Configure a qpid router connector
#
# @param host
#   Host/address to listen on
# @param port
#   Port to listen on
# @param sasl_mech
#   SASL mechanism to use
# @param role
#   Listener role
# @param ssl_profile
#   SSL profile to use
# @param idle_timeout
#   Timeout in seconds
define qpid::router::connector(
  String $host = '127.0.0.1',
  Integer[0, 65535] $port = 5672,
  Optional[String] $sasl_mech = 'ANONYMOUS',
  Optional[Enum['normal', 'inter-router', 'route-container']] $role = undef,
  Optional[String] $ssl_profile = undef,
  Optional[Integer[0]] $idle_timeout = undef,
){

  concat::fragment {"qdrouter+connector_${name}.conf":
    target  => $qpid::router::config_file,
    content => template('qpid/router/connector.conf.erb'),
    order   => '03',
  }

}
