class qpid::config {

  user { 'qpidd':
    ensure => present,
    groups => [$::certs::group],
  }

  file { "/etc/qpidd.conf":
    content => template("qpid/etc/qpidd.conf.erb")
  }

}
