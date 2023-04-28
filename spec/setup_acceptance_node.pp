package { 'glibc-langpack-en':
  ensure => installed,
}

yumrepo { 'powertools':
  enabled => true,
}

class { 'foreman::repo':
  repo => 'nightly',
}

class { 'katello::repo':
  repo_version => 'nightly',
}
