# Define: qpid::bind_event
#
# This define binds the event queue with the correct messages
#
# === Parameters
#
# $queue::                      Name of the event queue
#
# $hostname::                   Set to localhost for qpid-config operations
#
# $port::                       Port that qpid is listening on
#
# $ssl_cert::                   SSL cert to use for qpid-config commands
define qpid::bind_event(
  $queue,
  $hostname = 'localhost',
  $port = 5671,
  $ssl_cert = undef
)
{
  if($ssl_cert) {
    $ssl_option = "--ssl-certificate ${ssl_cert}"
    $protocol = 'amqps'
  } else {
    $ssl_option = undef
    $protocol = 'amqp'
  }
  exec { "bind queue to exchange and filter messages that deal with ${title}":
    command   => "qpid-config ${ssl_option} -b ${protocol}://${hostname}:${port} bind event ${queue} ${title}",
    onlyif    => "qpid-config ${ssl_option} -b ${protocol}://${hostname}:${port} exchanges event -r | grep ${title}",
    path      => '/usr/bin',
    require   => Service['qpidd'],
    logoutput => true,
  }
}
