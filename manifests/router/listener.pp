# == Define: qpid::router::listener
#
# Configure a qpid router listener
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
# $role::           Listener role
#
# $idle_timeout::   Timeout in seconds
#
define qpid::router::listener(
  Optional[String] $ssl_profile = undef,
  Optional[String] $host = undef,
  Integer[0, 65535] $port = 5672,
  Optional[String] $sasl_mech = 'ANONYMOUS',
  Optional[Enum['normal', 'inter-router', 'route-container']] $role = undef,
  Optional[Integer[0]] $idle_timeout = undef,
){

  concat::fragment {"qdrouter+listener_${title}.conf":
    target  => $qpid::router::config_file,
    content => template('qpid/router/listener.conf.erb'),
    order   => '05',
  }

}
