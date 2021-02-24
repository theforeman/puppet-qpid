# This define wraps the qpid-config command
#
# @param command
#   The qpid-config command including parameters to execute
# @param onlyif
#   The qpid-config command including parameters to check if $command should be
#   executed
# @param unless
#   The qpid-config command including parameters to check if $command should
#   not be executed. Ignored if $onlyif is specified
# @param hostname
#   The hostname to connect to
# @param port
#   Port that qpid is listening on
# @param ssl_cert
#   SSL cert to use for qpid-config commands
# @param ssl_key
#   SSL key to use for qpid-config commands
# @param username
#   An optional username to pass in. This is mostly relevant when a SASL mechanism is passed
# @param sasl_mechanism
#   Select a SASL mechanism, like EXTERNAL
define qpid::config_cmd (
  $command,
  $onlyif = false,
  $unless = false,
  $hostname = 'localhost',
  $port = undef,
  $ssl_cert = undef,
  $ssl_key = undef,
  Optional[String] $username = undef,
  Optional[String] $sasl_mechanism = undef,
) {
  include qpid::tools

  $mech = bool2str($sasl_mechanism =~ NotUndef, " --sasl-mechanism=${sasl_mechanism}", '')
  $auth = bool2str($username =~ NotUndef, "${username}@", '')

  if $ssl_cert and $ssl_key {
    $_port = pick($port, 5671)
    $base_cmd = "qpid-config${mech} --ssl-certificate ${ssl_cert} --ssl-key ${ssl_key} -b amqps://${auth}${hostname}:${_port}"
  } elsif $ssl_cert or $ssl_key {
    fail('When using SSL both, $ssl_cert and $ssl_key must be specified')
  } else {
    $_port = pick($port, 5672)
    $base_cmd = "qpid-config${mech} -b amqp://${auth}${hostname}:${_port}"
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
