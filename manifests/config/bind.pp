# This define binds the queue with the correct messages
#
# @param queue
#   Name of the queue
# @param exchange
#   Name of the exchange the queue is on
# @param hostname
#   Hostname of the qpid broker
# @param port
#   Port that qpid is listening on
# @param ssl_cert
#   SSL cert to use for qpid-config commands
# @param ssl_key
#   SSL key to use for qpid-config commands
define qpid::config::bind(
  $queue,
  $exchange,
  $hostname = undef,
  $port = undef,
  $ssl_cert = undef,
  $ssl_key = undef,
)
{
  $cmd = "bind queue to exchange and filter messages that deal with ${title}"
  qpid::config_cmd { $cmd:
    command  => "bind ${exchange} ${queue} ${title}",
    unless   => "exchanges ${exchange} -r | grep ${title}",
    hostname => $hostname,
    port     => $port,
    ssl_cert => $ssl_cert,
    ssl_key  => $ssl_key,
  }

  Qpid::Config::Exchange <| exchange == $exchange |> -> Qpid::Config_cmd[$cmd]
  Qpid::Config::Queue <| queue == $queue |> -> Qpid::Config_cmd[$cmd]
}
