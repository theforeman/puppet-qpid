# == Define: qpid::router::connector
#
# Configure a qpid router connector
#
# == Parameters
#
# $ssl_profile::    SSL profile to use
#
# $host::           Host/address to listen on
#
# $port::           Port to listen on
#
# $sasl_mech::      SASL mechanism to use
#
# $sasl_username::  SASL username
#
# $sasl_password::  SASL password
#
# $role::           Listener role
#
# $idle_timeout::   Timeout in seconds
#
define qpid::router::connector(
  String $host = '127.0.0.1',
  Integer[0, 65535] $port = 5672,
  Optional[String] $sasl_mech = 'ANONYMOUS',
  Optional[String] $sasl_username = undef,
  Optional[String] $sasl_password = undef,
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
