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
# $hostname::                   The hostname to connect to
#
# $port::                       Port that qpid is listening on
#
# $ssl_cert::                   SSL cert to use for qpid-config commands
define qpid::config_cmd (
  $command,
  $onlyif = false,
  $unless = false,
  $hostname = 'localhost',
  $port = undef,
  $ssl_cert = undef,
) {
  if $ssl_cert {
    $_port = pick($port, 5671)
    $base_cmd = "qpid-config --ssl-certificate ${ssl_cert} -b amqps://${hostname}:${_port}"
  } else {
    $_port = pick($port, 5672)
    $base_cmd = "qpid-config -b amqp://${hostname}:${_port}"
  }

  if $onlyif {
    exec { "qpid-config ${title}":
      command   => "${base_cmd} ${command}",
      onlyif    => "${base_cmd} ${onlyif}",
      path      => '/usr/bin',
      require   => Service['qpidd'],
      logoutput => true,
    }
  } elsif $unless {
    exec { "qpid-config ${title}":
      command   => "${base_cmd} ${command}",
      unless    => "${base_cmd} ${unless}",
      path      => '/usr/bin',
      require   => Service['qpidd'],
      logoutput => true,
    }
  }
}
