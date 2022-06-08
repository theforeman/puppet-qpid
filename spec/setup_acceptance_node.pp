package { 'glibc-langpack-en':
  ensure => installed,
}

yumrepo { 'powertools':
  enabled => true,
}

yumrepo { 'katello':
  baseurl  => "http://yum.theforeman.org/katello/nightly/katello/el8/x86_64/",
  gpgcheck => 0,
}
