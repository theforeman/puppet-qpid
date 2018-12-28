# This define ensures an exchange exists
#
# @param exchange
#   Name of the exchange
# @param hostname
#   Hostname of the qpid broker
# @param port
#   Port that qpid is listening on
# @param ssl_cert
#   SSL cert to use for qpid-config commands
# @param ssl_key
#   SSL key to use for qpid-config commands
define qpid::config::exchange(
  $exchange = $title,
  $hostname = undef,
  $port = undef,
  $ssl_cert = undef,
  $ssl_key = undef,
)
{
  qpid::config_cmd { "ensure exchange ${exchange}":
    command  => "add exchange topic ${exchange} --durable",
    unless   => "exchanges ${exchange}",
    hostname => $hostname,
    port     => $port,
    ssl_cert => $ssl_cert,
    ssl_key  => $ssl_key,
  }
}
