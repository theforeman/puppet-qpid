if $facts['os']['release']['major'] == '8' {
  package { 'glibc-langpack-en':
    ensure => installed,
  }

  # See https://wiki.centos.org/Manuals/ReleaseNotes/CentOS8.2011#Yum_repo_file_and_repoid_changes
  if $facts['os']['release']['minor'] >= '3' {
    $powertools_repo = 'powertools'
  } else {
    $powertools_repo = 'PowerTools'
  }
  yumrepo { $powertools_repo:
    enabled => true,
  }

  yumrepo { 'katello':
    baseurl  => "http://yum.theforeman.org/katello/nightly/katello/el8/x86_64/",
    gpgcheck => 0,
  }
} elsif $facts['os']['release']['major'] == '7' {
  package { 'epel-release':
    ensure => installed,
  }
}
