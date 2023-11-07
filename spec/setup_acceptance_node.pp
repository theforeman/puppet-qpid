package { 'glibc-langpack-en':
  ensure => installed,
}

yumrepo { 'powertools':
  enabled => true,
}

class { 'foreman::repo':
  repo => '3.7',
}

# qpid was dropped in Katello 4.10
class { 'katello::repo':
  repo_version => '4.9',
}
