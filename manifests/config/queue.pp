# This define ensures a queue exists
#
# @param queue
#   Name of the queue
# @param hostname
#   Hostname of the qpid broker
# @param port
#   Port that qpid is listening on
# @param ssl_cert
#   SSL cert to use for qpid-config commands
# @param ssl_key
#   SSL key to use for qpid-config commands
define qpid::config::queue(
  $queue = $title,
  $hostname = undef,
  $port = undef,
  $ssl_cert = undef,
  $ssl_key = undef,
)
{
  qpid::config_cmd { "ensure queue ${queue}":
    command  => "add queue ${queue} --durable",
    unless   => "queues ${queue}",
    hostname => $hostname,
    port     => $port,
    ssl_cert => $ssl_cert,
    ssl_key  => $ssl_key,
  }
}
