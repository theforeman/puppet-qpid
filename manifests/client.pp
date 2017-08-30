# == Class: qpid::client
#
# Handles Qpid client package installations and configuration
#
class qpid::client(
  String $version = $qpid::client::params::version,
  Stdlib::Absolutepath $config_file = $qpid::client::params::config_file,
  String $log_level = $qpid::client::params::log_level,
  Boolean $ssl = $qpid::client::params::ssl,
  Integer[0, 65535] $ssl_port  = $qpid::client::params::ssl_port,
  Optional[Stdlib::Absolutepath] $ssl_cert_db = $qpid::client::params::ssl_cert_db,
  Optional[Stdlib::Absolutepath] $ssl_cert_password_file = $qpid::client::params::ssl_cert_password_file,
  Optional[String] $ssl_cert_name = $qpid::client::params::ssl_cert_name,
  Array[String] $client_packages = $qpid::client::params::client_packages,
) inherits qpid::client::params {

  package { $client_packages:
    ensure => $version,
  } ->
  file { $config_file:
    ensure  => file,
    content => template('qpid/qpidc.conf.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

}
