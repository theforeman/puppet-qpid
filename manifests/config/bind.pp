# Define: qpid::config::bind
#
# This define binds the queue with the correct messages
#
# === Parameters
#
# $queue::                      Name of the queue
#
# $exchange::                   Name of the exchange the queue is on
#
# $hostname::                   Hostname of the qpid broker
#
# $port::                       Port that qpid is listening on
#
# $ssl_cert::                   SSL cert to use for qpid-config commands
#
# $ssl_key::                    SSL key to use for qpid-config commands
#
define qpid::config::bind(
  $queue,
  $exchange,
  $hostname = undef,
  $port = undef,
  $ssl_cert = undef,
  $ssl_key = undef,
)
{
  qpid::config_cmd { "bind queue to exchange and filter messages that deal with ${title}":
    command  => "bind ${exchange} ${queue} ${title}",
    unless   => "exchanges ${exchange} -r | grep ${title}",
    hostname => $hostname,
    port     => $port,
    ssl_cert => $ssl_cert,
    ssl_key  => $ssl_key,
  }
}
