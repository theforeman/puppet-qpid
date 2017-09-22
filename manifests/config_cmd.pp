# Define: qpid::config_cmd
#
# This define wraps the qpid-config command
#
# === Parameters
#
# $command::                    The qpid-config command including parameters to execute
#
# $onlyif::                     The qpid-config command including parameters to
#                               check if $command should be executed
#
# $unless::                     The qpid-config command including parameters to
#                               check if $command should not be executed.
#                               Ignored if $onlyif is specified
#
# $hostname::                   The hostname to connect to
#
# $port::                       Port that qpid is listening on
#
# $ssl_cert::                   SSL cert to use for qpid-config commands
#
# $ssl_key::                    SSL key to use for qpid-config commands
#
define qpid::config_cmd (
  $command,
  $onlyif = false,
  $unless = false,
  $hostname = 'localhost',
  $port = undef,
  $ssl_cert = undef,
  $ssl_key = undef,
) {
  include ::qpid::tools

  if $ssl_cert and $ssl_key {
    $_port = pick($port, 5671)
    $base_cmd = "qpid-config --ssl-certificate ${ssl_cert} --ssl-key ${ssl_key} -b amqps://${hostname}:${_port}"
  } elsif $ssl_cert or $ssl_key {
    fail('When using SSL both, $ssl_cert and $ssl_key must be specified')
  } else {
    $_port = pick($port, 5672)
    $base_cmd = "qpid-config -b amqp://${hostname}:${_port}"
  }

  if $onlyif {
    exec { "qpid-config ${title}":
      command   => "${base_cmd} ${command}",
      onlyif    => "${base_cmd} ${onlyif}",
      path      => '/usr/bin',
      logoutput => true,
    }
  } elsif $unless {
    exec { "qpid-config ${title}":
      command   => "${base_cmd} ${command}",
      unless    => "${base_cmd} ${unless}",
      path      => '/usr/bin',
      logoutput => true,
    }
  } else {
    fail('Either $onlyif or $unless must be specified')
  }

  Service <| tag == 'qpidd' |> -> Exec["qpid-config ${title}"]
}
