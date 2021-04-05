if $facts['os']['release']['major'] == '8' {
  package { 'glibc-langpack-en':
    ensure => installed,
  }

  yumrepo { 'powertools':
    enabled => true,
  }
} elsif $facts['os']['release']['major'] == '7' {
  package { 'epel-release':
    ensure => installed,
  }
}
