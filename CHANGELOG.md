# Changelog

## [11.0.0](https://github.com/theforeman/puppet-qpid/tree/11.0.0) (2023-11-14)

[Full Changelog](https://github.com/theforeman/puppet-qpid/compare/10.0.0...11.0.0)

**Breaking changes:**

- Drop Puppet 6 & update CI to the latest versions [\#187](https://github.com/theforeman/puppet-qpid/pull/187) ([ekohl](https://github.com/ekohl))

**Implemented enhancements:**

- Mark compatible with Puppet 8 [\#188](https://github.com/theforeman/puppet-qpid/pull/188) ([ekohl](https://github.com/ekohl))
- Mark compatible with puppetlabs-stdlib 9.x, puppetlabs-concat 9.x & puppet-systemd 5.x & 6.x [\#186](https://github.com/theforeman/puppet-qpid/pull/186) ([ekohl](https://github.com/ekohl))

## [10.0.0](https://github.com/theforeman/puppet-qpid/tree/10.0.0) (2023-05-23)

[Full Changelog](https://github.com/theforeman/puppet-qpid/compare/9.1.0...10.0.0)

**Breaking changes:**

- Drop EL7 support [\#178](https://github.com/theforeman/puppet-qpid/pull/178) ([ehelms](https://github.com/ehelms))

**Implemented enhancements:**

- Mark compatible with puppetlabs/concat 8.x [\#182](https://github.com/theforeman/puppet-qpid/pull/182) ([ekohl](https://github.com/ekohl))
- Mark compatible with puppet-systemd 4 [\#180](https://github.com/theforeman/puppet-qpid/pull/180) ([evgeni](https://github.com/evgeni))
- Update to voxpupuli-test 5 [\#179](https://github.com/theforeman/puppet-qpid/pull/179) ([ekohl](https://github.com/ekohl))

**Merged pull requests:**

- fix acceptance node setup [\#181](https://github.com/theforeman/puppet-qpid/pull/181) ([evgeni](https://github.com/evgeni))

## [9.1.0](https://github.com/theforeman/puppet-qpid/tree/9.1.0) (2021-10-29)

[Full Changelog](https://github.com/theforeman/puppet-qpid/compare/9.0.0...9.1.0)

**Implemented enhancements:**

- Support puppet/stdlib 8 [\#175](https://github.com/theforeman/puppet-qpid/pull/175) ([ehelms](https://github.com/ehelms))
- Switch to puppet/systemd [\#173](https://github.com/theforeman/puppet-qpid/pull/173) ([ekohl](https://github.com/ekohl))

## [9.0.0](https://github.com/theforeman/puppet-qpid/tree/9.0.0) (2021-07-22)

[Full Changelog](https://github.com/theforeman/puppet-qpid/compare/8.0.0...9.0.0)

**Breaking changes:**

- Drop Puppet 5 support [\#169](https://github.com/theforeman/puppet-qpid/pull/169) ([ehelms](https://github.com/ehelms))

**Implemented enhancements:**

- Mark compatible with camptocamp/systemd 3 [\#168](https://github.com/theforeman/puppet-qpid/pull/168) ([ekohl](https://github.com/ekohl))
- Allow Puppet 7 compatible versions of mods [\#164](https://github.com/theforeman/puppet-qpid/pull/164) ([ekohl](https://github.com/ekohl))

## [8.0.0](https://github.com/theforeman/puppet-qpid/tree/8.0.0) (2021-04-15)

[Full Changelog](https://github.com/theforeman/puppet-qpid/compare/7.1.0...8.0.0)

**Breaking changes:**

- Fix qpid-dispatch parameter deprecation warnings [\#162](https://github.com/theforeman/puppet-qpid/pull/162) ([ehelms](https://github.com/ehelms))

**Implemented enhancements:**

- Refs [\#32037](https://projects.theforeman.org/issues/32037): Manage /var/lib/qpidd [\#161](https://github.com/theforeman/puppet-qpid/pull/161) ([ehelms](https://github.com/ehelms))
- Refs [\#32037](https://projects.theforeman.org/issues/32037): Add ensure on qpid::tools class to allow removal of package [\#158](https://github.com/theforeman/puppet-qpid/pull/158) ([wbclark](https://github.com/wbclark))
- Add EL8 support [\#155](https://github.com/theforeman/puppet-qpid/pull/155) ([ehelms](https://github.com/ehelms))
- Refs [\#32037](https://projects.theforeman.org/issues/32037): Add ensure on qpid class to allow removal of all qpid as… [\#154](https://github.com/theforeman/puppet-qpid/pull/154) ([ehelms](https://github.com/ehelms))

**Fixed bugs:**

- Refs [\#32037](https://projects.theforeman.org/issues/32037): Do not remove all packages when ensuring absent [\#159](https://github.com/theforeman/puppet-qpid/pull/159) ([ehelms](https://github.com/ehelms))

## [7.1.0](https://github.com/theforeman/puppet-qpid/tree/7.1.0) (2021-03-31)

[Full Changelog](https://github.com/theforeman/puppet-qpid/compare/7.0.0...7.1.0)

**Implemented enhancements:**

- Add types to router.pp [\#152](https://github.com/theforeman/puppet-qpid/pull/152) ([ehelms](https://github.com/ehelms))
- Remove duplicate relations [\#150](https://github.com/theforeman/puppet-qpid/pull/150) ([ekohl](https://github.com/ekohl))
- Install cyrus-sasl-plain package [\#149](https://github.com/theforeman/puppet-qpid/pull/149) ([ehelms](https://github.com/ehelms))
- Refs [\#32037](https://projects.theforeman.org/issues/32037): Add parameters to disable qpid services [\#148](https://github.com/theforeman/puppet-qpid/pull/148) ([ehelms](https://github.com/ehelms))
- Support Puppet 7 [\#147](https://github.com/theforeman/puppet-qpid/pull/147) ([ekohl](https://github.com/ekohl))

**Fixed bugs:**

- Router template should use mode and not router\_mode [\#153](https://github.com/theforeman/puppet-qpid/pull/153) ([ehelms](https://github.com/ehelms))

## [7.0.0](https://github.com/theforeman/puppet-qpid/tree/7.0.0) (2021-03-01)

[Full Changelog](https://github.com/theforeman/puppet-qpid/compare/6.2.0...7.0.0)

**Breaking changes:**

- Use modern facts [\#134](https://github.com/theforeman/puppet-qpid/issues/134)

**Implemented enhancements:**

- Expose username and sasl\_mechanism options in config\_cmd [\#145](https://github.com/theforeman/puppet-qpid/pull/145) ([ekohl](https://github.com/ekohl))

## [6.2.0](https://github.com/theforeman/puppet-qpid/tree/6.2.0) (2020-11-30)

[Full Changelog](https://github.com/theforeman/puppet-qpid/compare/6.1.0...6.2.0)

**Implemented enhancements:**

- Fixes [\#30252](https://projects.theforeman.org/issues/30252): Make wait for port more resilient [\#137](https://github.com/theforeman/puppet-qpid/pull/137) ([ehelms](https://github.com/ehelms))

## [6.1.0](https://github.com/theforeman/puppet-qpid/tree/6.1.0) (2020-02-11)

[Full Changelog](https://github.com/theforeman/puppet-qpid/compare/6.0.0...6.1.0)

**Implemented enhancements:**

- Fixes [\#28672](https://projects.theforeman.org/issues/28672) - Check if qpid is up using localhost [\#128](https://github.com/theforeman/puppet-qpid/pull/128) ([ekohl](https://github.com/ekohl))

## [6.0.0](https://github.com/theforeman/puppet-qpid/tree/6.0.0) (2019-05-31)

[Full Changelog](https://github.com/theforeman/puppet-qpid/compare/5.0.0...6.0.0)

**Breaking changes:**

- Drop python2-qpid as a server package [\#124](https://github.com/theforeman/puppet-qpid/pull/124) ([ehelms](https://github.com/ehelms))

**Merged pull requests:**

- Allow `puppetlabs/stdlib` and `puppetlabs/concat` 6.x [\#125](https://github.com/theforeman/puppet-qpid/pull/125) ([alexjfisher](https://github.com/alexjfisher))

## [5.0.0](https://github.com/theforeman/puppet-qpid/tree/5.0.0) (2019-04-15)

[Full Changelog](https://github.com/theforeman/puppet-qpid/compare/4.5.0...5.0.0)

**Breaking changes:**

- Drop Puppet 4 [\#121](https://github.com/theforeman/puppet-qpid/pull/121) ([ekohl](https://github.com/ekohl))
- Drop unused python2-qpid-qmf [\#119](https://github.com/theforeman/puppet-qpid/pull/119) ([ehelms](https://github.com/ehelms))
- Move to using python2 package names [\#117](https://github.com/theforeman/puppet-qpid/pull/117) ([ehelms](https://github.com/ehelms))

## [4.5.0](https://github.com/theforeman/puppet-qpid/tree/4.5.0) (2019-04-11)

[Full Changelog](https://github.com/theforeman/puppet-qpid/compare/4.4.1...4.5.0)

**Implemented enhancements:**

- Refs [\#26571](https://projects.theforeman.org/issues/26571) - Support ACL file & router auth [\#120](https://github.com/theforeman/puppet-qpid/pull/120) ([jturel](https://github.com/jturel))

**Fixed bugs:**

- bump camptocamp/systemd requirement to \>= 1.0.0 [\#118](https://github.com/theforeman/puppet-qpid/pull/118) ([evgeni](https://github.com/evgeni))

## [4.4.1](https://github.com/theforeman/puppet-qpid/tree/4.4.1) (2019-02-14)

[Full Changelog](https://github.com/theforeman/puppet-qpid/compare/4.4.0...4.4.1)

**Fixed bugs:**

- Fixes [\#25909](https://projects.theforeman.org/issues/25909) - make qpidd.service wait until the port is open [\#113](https://github.com/theforeman/puppet-qpid/pull/113) ([evgeni](https://github.com/evgeni))

## [4.4.0](https://github.com/theforeman/puppet-qpid/tree/4.4.0) (2019-01-11)

[Full Changelog](https://github.com/theforeman/puppet-qpid/compare/4.3.0...4.4.0)

**Implemented enhancements:**

- Refactor docs from yardoc to rdoc [\#110](https://github.com/theforeman/puppet-qpid/pull/110) ([ekohl](https://github.com/ekohl))
- Allow arbitrary settings [\#107](https://github.com/theforeman/puppet-qpid/pull/107) ([ekohl](https://github.com/ekohl))
- Add Puppet 6 support [\#106](https://github.com/theforeman/puppet-qpid/pull/106) ([ekohl](https://github.com/ekohl))

**Merged pull requests:**

- Update README [\#105](https://github.com/theforeman/puppet-qpid/pull/105) ([ekohl](https://github.com/ekohl))
## [4.3.0](https://github.com/theforeman/puppet-qpid/tree/4.3.0) (2018-10-04)

[Full Changelog](https://github.com/theforeman/puppet-qpid/compare/4.2.3...4.3.0)

**Implemented enhancements:**

- Allow stdlib and concat 5.x versions [\#103](https://github.com/theforeman/puppet-qpid/pull/103) ([ekohl](https://github.com/ekohl))
- Fixes [\#24415](https://projects.theforeman.org/issues/24415) - Add hello interval/max\_age params to qdrouterd. [\#98](https://github.com/theforeman/puppet-qpid/pull/98) ([chris1984](https://github.com/chris1984))

## [4.2.3](https://github.com/theforeman/puppet-qpid/tree/4.2.3) (2018-07-25)

[Full Changelog](https://github.com/theforeman/puppet-qpid/compare/4.2.2...4.2.3)

**Fixed bugs:**

- Properly handle systemd\_limits [\#96](https://github.com/theforeman/puppet-qpid/pull/96) ([ekohl](https://github.com/ekohl))

## [4.2.2](https://github.com/theforeman/puppet-qpid/tree/4.2.2) (2018-07-16)

[Full Changelog](https://github.com/theforeman/puppet-qpid/compare/4.2.1...4.2.2)

**Merged pull requests:**

- Allow camptocamp/systemd 2.x [\#93](https://github.com/theforeman/puppet-qpid/pull/93) ([ekohl](https://github.com/ekohl))

## [4.2.1](https://github.com/theforeman/puppet-qpid/tree/4.2.1) (2018-05-31)

[Full Changelog](https://github.com/theforeman/puppet-qpid/compare/4.2.0...4.2.1)

**Fixed bugs:**

- refs [\#23557](https://projects.theforeman.org/issues/23557) - support logging to syslog [\#90](https://github.com/theforeman/puppet-qpid/pull/90) ([stbenjam](https://github.com/stbenjam))

## [4.2.0](https://github.com/theforeman/puppet-qpid/tree/4.2.0) (2018-03-12)

[Full Changelog](https://github.com/theforeman/puppet-qpid/compare/4.1.0...4.2.0)

**Merged pull requests:**

- Refs [\#22513](https://projects.theforeman.org/issues/22513) - add default queue param [\#89](https://github.com/theforeman/puppet-qpid/pull/89) ([chris1984](https://github.com/chris1984))
- refs [\#21350](https://projects.theforeman.org/issues/21350) - allow restricting ciphers and protocols [\#88](https://github.com/theforeman/puppet-qpid/pull/88) ([stbenjam](https://github.com/stbenjam))

## [4.1.0](https://github.com/theforeman/puppet-qpid/tree/4.1.0) (2018-02-28)

[Full Changelog](https://github.com/theforeman/puppet-qpid/compare/4.0.0...4.1.0)

**Implemented enhancements:**

- Fixes [\#22465](https://projects.theforeman.org/issues/22465) - Add mgmt interval param [\#86](https://github.com/theforeman/puppet-qpid/pull/86) ([chris1984](https://github.com/chris1984))

## [4.0.0](https://github.com/theforeman/puppet-qpid/tree/4.0.0) (2018-01-25)

[Full Changelog](https://github.com/theforeman/puppet-qpid/compare/3.1.1...4.0.0)

**Breaking changes:**

- fixes [\#22289](https://projects.theforeman.org/issues/22289) - update for dispatch router 1.0 [\#83](https://github.com/theforeman/puppet-qpid/pull/83) ([stbenjam](https://github.com/stbenjam))

**Implemented enhancements:**

- Update Github URLs [\#80](https://github.com/theforeman/puppet-qpid/pull/80) ([ekohl](https://github.com/ekohl))

## [3.1.1](https://github.com/theforeman/puppet-qpid/tree/3.1.1) (2017-10-18)

[Full Changelog](https://github.com/theforeman/puppet-qpid/compare/3.1.0...3.1.1)

**Closed issues:**

- Changelog [\#72](https://github.com/theforeman/puppet-qpid/issues/72)

**Merged pull requests:**

- ensure config\_cmd has qpid-tools installed [\#77](https://github.com/theforeman/puppet-qpid/pull/77) ([timogoebel](https://github.com/timogoebel))
- Allow camptocamp/systemd 1.0.0 [\#76](https://github.com/theforeman/puppet-qpid/pull/76) ([ekohl](https://github.com/ekohl))
- Update CHANGELOG.md [\#75](https://github.com/theforeman/puppet-qpid/pull/75) ([ekohl](https://github.com/ekohl))

## [3.1.0](https://github.com/theforeman/puppet-qpid/tree/3.1.0) (2017-08-30)

[Full Changelog](https://github.com/theforeman/puppet-qpid/compare/3.0.0...3.1.0)

**Closed issues:**

- Installation fails without manual intervention on CentOS7 [\#46](https://github.com/theforeman/puppet-qpid/issues/46)

**Merged pull requests:**

- Refactor qpid::client [\#74](https://github.com/theforeman/puppet-qpid/pull/74) ([ekohl](https://github.com/ekohl))
- Fix README markdown [\#73](https://github.com/theforeman/puppet-qpid/pull/73) ([alexjfisher](https://github.com/alexjfisher))
- Package conflicts during install on CentOS7, fixes [\#46](https://projects.theforeman.org/issues/46) [\#47](https://github.com/theforeman/puppet-qpid/pull/47) ([braddeicide](https://github.com/braddeicide))

## [3.0.0](https://github.com/theforeman/puppet-qpid/tree/3.0.0) (2017-08-14)

[Full Changelog](https://github.com/theforeman/puppet-qpid/compare/2.2.0...3.0.0)

**Merged pull requests:**

- Improve qpid::config::\* defines [\#71](https://github.com/theforeman/puppet-qpid/pull/71) ([ekohl](https://github.com/ekohl))
- msync: Puppet 5, parallel tests, .erb templates, cleanups, facter fix [\#69](https://github.com/theforeman/puppet-qpid/pull/69) ([ekohl](https://github.com/ekohl))
- Allow puppetlabs-concat 4.0.0 [\#60](https://github.com/theforeman/puppet-qpid/pull/60) ([ekohl](https://github.com/ekohl))
- Contain router classes [\#63](https://github.com/theforeman/puppet-qpid/pull/63) ([ekohl](https://github.com/ekohl))
- Add a spec test for qpid::router [\#61](https://github.com/theforeman/puppet-qpid/pull/61) ([ekohl](https://github.com/ekohl))
- Convert to Puppet 4 types [\#59](https://github.com/theforeman/puppet-qpid/pull/59) ([ekohl](https://github.com/ekohl))

## [2.2.0](https://github.com/theforeman/puppet-qpid/tree/2.2.0) (2017-07-31)
[Full Changelog](https://github.com/theforeman/puppet-qpid/compare/2.1.1...2.2.0)

**Merged pull requests:**

- Support open files limit on qpidd too [\#70](https://github.com/theforeman/puppet-qpid/pull/70) ([chris1984](https://github.com/chris1984))
- Refs [\#19929](https://projects.theforeman.org/issues/19929) - Add wcache-page-size to installer [\#65](https://github.com/theforeman/puppet-qpid/pull/65) ([chris1984](https://github.com/chris1984))
- Fixes [\#19514](https://projects.theforeman.org/issues/19514) - Add session-max-unacked option [\#62](https://github.com/theforeman/puppet-qpid/pull/62) ([chris1984](https://github.com/chris1984))

## [2.1.1](https://github.com/theforeman/puppet-qpid/tree/2.1.1) (2017-06-14)
[Full Changelog](https://github.com/theforeman/puppet-qpid/compare/2.1.0...2.1.1)

**Merged pull requests:**

- Fixes [\#18812](https://projects.theforeman.org/issues/18812) - update puppet logic on qpid bind [\#66](https://github.com/theforeman/puppet-qpid/pull/66) ([chris1984](https://github.com/chris1984))

## [2.1.0](https://github.com/theforeman/puppet-qpid/tree/2.1.0) (2017-04-07)

[Full Changelog](https://github.com/theforeman/puppet-qpid/compare/2.0.0...2.1.0)

**Merged pull requests:**

- Expand ignore with generated files/directories [\#58](https://github.com/theforeman/puppet-qpid/pull/58) ([ekohl](https://github.com/ekohl))
- Modulesync update [\#57](https://github.com/theforeman/puppet-qpid/pull/57) ([ekohl](https://github.com/ekohl))
- Contain classes [\#56](https://github.com/theforeman/puppet-qpid/pull/56) ([ekohl](https://github.com/ekohl))
- config\_cmd: optional qpidd, documentation, tests [\#55](https://github.com/theforeman/puppet-qpid/pull/55) ([ekohl](https://github.com/ekohl))
- Modulesync update [\#54](https://github.com/theforeman/puppet-qpid/pull/54) ([ekohl](https://github.com/ekohl))
- Introduce qpid::config\_cmd as qpid-config wrapper [\#53](https://github.com/theforeman/puppet-qpid/pull/53) ([ekohl](https://github.com/ekohl))
- Re-factor bind\_event to the generic bind action [\#52](https://github.com/theforeman/puppet-qpid/pull/52) ([ehelms](https://github.com/ehelms))
- Refs [\#18812](https://projects.theforeman.org/issues/18812) - Add event queue binding define [\#51](https://github.com/theforeman/puppet-qpid/pull/51) ([chris1984](https://github.com/chris1984))
- Configure performance tuning settings for qpid [\#50](https://github.com/theforeman/puppet-qpid/pull/50) ([stbenjam](https://github.com/stbenjam))
- Update modulesync config [\#49](https://github.com/theforeman/puppet-qpid/pull/49) ([ekohl](https://github.com/ekohl))

## [2.0.0](https://github.com/theforeman/puppet-qpid/tree/2.0.0) (2016-11-22)

[Full Changelog](https://github.com/theforeman/puppet-qpid/compare/1.3.1...2.0.0)

**Merged pull requests:**

- module sync update [\#48](https://github.com/theforeman/puppet-qpid/pull/48) ([jlsherrill](https://github.com/jlsherrill))
- Move parameters into categories [\#45](https://github.com/theforeman/puppet-qpid/pull/45) ([stbenjam](https://github.com/stbenjam))
- Modulesync, bump major for 1.8.7/el6 drop [\#44](https://github.com/theforeman/puppet-qpid/pull/44) ([stbenjam](https://github.com/stbenjam))
- Modulesync [\#43](https://github.com/theforeman/puppet-qpid/pull/43) ([stbenjam](https://github.com/stbenjam))
- Modulesync [\#42](https://github.com/theforeman/puppet-qpid/pull/42) ([stbenjam](https://github.com/stbenjam))

## [1.3.1](https://github.com/theforeman/puppet-qpid/tree/1.3.1) (2016-10-14)

[Full Changelog](https://github.com/theforeman/puppet-qpid/compare/1.3.0...1.3.1)

**Merged pull requests:**

- Dispatch router log option is 'enable' not 'enabled' [\#41](https://github.com/theforeman/puppet-qpid/pull/41) ([stbenjam](https://github.com/stbenjam))

## [1.3.0](https://github.com/theforeman/puppet-qpid/tree/1.3.0) (2016-09-12)

[Full Changelog](https://github.com/theforeman/puppet-qpid/compare/1.2.2...1.3.0)

**Merged pull requests:**

- support updating the version [\#40](https://github.com/theforeman/puppet-qpid/pull/40) ([cristifalcas](https://github.com/cristifalcas))
- Modulesync update [\#39](https://github.com/theforeman/puppet-qpid/pull/39) ([ehelms](https://github.com/ehelms))
- Modulesync: pin json\_pure [\#38](https://github.com/theforeman/puppet-qpid/pull/38) ([stbenjam](https://github.com/stbenjam))
- refs [\#15217](https://projects.theforeman.org/issues/15217) - puppet 4 support [\#37](https://github.com/theforeman/puppet-qpid/pull/37) ([stbenjam](https://github.com/stbenjam))
- Modulesync [\#35](https://github.com/theforeman/puppet-qpid/pull/35) ([stbenjam](https://github.com/stbenjam))

## [1.2.2](https://github.com/theforeman/puppet-qpid/tree/1.2.2) (2016-02-01)

[Full Changelog](https://github.com/theforeman/puppet-qpid/compare/1.2.1...1.2.2)

## [1.2.1](https://github.com/theforeman/puppet-qpid/tree/1.2.1) (2016-02-01)

[Full Changelog](https://github.com/theforeman/puppet-qpid/compare/1.2.0...1.2.1)

## [1.2.0](https://github.com/theforeman/puppet-qpid/tree/1.2.0) (2016-02-01)

[Full Changelog](https://github.com/theforeman/puppet-qpid/compare/1.1.1...1.2.0)

**Merged pull requests:**

- Remove concat\_native for puppetlabs-concat [\#34](https://github.com/theforeman/puppet-qpid/pull/34) ([ehelms](https://github.com/ehelms))
- Enable configuring dispatch router logging [\#33](https://github.com/theforeman/puppet-qpid/pull/33) ([stbenjam](https://github.com/stbenjam))
- don't manage policycoreutils-python, as it is not related to qpid [\#32](https://github.com/theforeman/puppet-qpid/pull/32) ([cristifalcas](https://github.com/cristifalcas))

## [1.1.1](https://github.com/theforeman/puppet-qpid/tree/1.1.1) (2015-10-23)

[Full Changelog](https://github.com/theforeman/puppet-qpid/compare/1.1.0...1.1.1)

**Merged pull requests:**

- fixes [\#12026](https://projects.theforeman.org/issues/12026) - support idle timeout on connectors and listeners [\#31](https://github.com/theforeman/puppet-qpid/pull/31) ([stbenjam](https://github.com/stbenjam))
- fixes [\#11285](https://projects.theforeman.org/issues/11285) - require qpid-cpp-server-linearstore [\#26](https://github.com/theforeman/puppet-qpid/pull/26) ([stbenjam](https://github.com/stbenjam))

## [1.1.0](https://github.com/theforeman/puppet-qpid/tree/1.1.0) (2015-10-15)

[Full Changelog](https://github.com/theforeman/puppet-qpid/compare/1.0.4...1.1.0)

**Merged pull requests:**

- Change ssl\_port to a string [\#30](https://github.com/theforeman/puppet-qpid/pull/30) ([ehelms](https://github.com/ehelms))
- refs [\#11737](https://projects.theforeman.org/issues/11737) - support listening on a particular interface [\#29](https://github.com/theforeman/puppet-qpid/pull/29) ([stbenjam](https://github.com/stbenjam))
- Add qpid::tools package [\#28](https://github.com/theforeman/puppet-qpid/pull/28) ([ehelms](https://github.com/ehelms))

## [1.0.4](https://github.com/theforeman/puppet-qpid/tree/1.0.4) (2015-08-11)

[Full Changelog](https://github.com/theforeman/puppet-qpid/compare/1.0.3...1.0.4)

**Merged pull requests:**

- Support asymmetric routing in qpid dispatcher [\#27](https://github.com/theforeman/puppet-qpid/pull/27) ([stbenjam](https://github.com/stbenjam))
- missed parameter [\#25](https://github.com/theforeman/puppet-qpid/pull/25) ([larkit-ian](https://github.com/larkit-ian))

## [1.0.3](https://github.com/theforeman/puppet-qpid/tree/1.0.3) (2015-07-20)

[Full Changelog](https://github.com/theforeman/puppet-qpid/compare/1.0.2...1.0.3)

**Merged pull requests:**

- Revert "remove qpid-tools package" [\#24](https://github.com/theforeman/puppet-qpid/pull/24) ([stbenjam](https://github.com/stbenjam))

## [1.0.2](https://github.com/theforeman/puppet-qpid/tree/1.0.2) (2015-07-16)

[Full Changelog](https://github.com/theforeman/puppet-qpid/compare/1.0.1...1.0.2)

**Merged pull requests:**

- Removes brackets around user\_group parameter [\#23](https://github.com/theforeman/puppet-qpid/pull/23) ([dkliban](https://github.com/dkliban))
- typo fix [\#22](https://github.com/theforeman/puppet-qpid/pull/22) ([beav](https://github.com/beav))
- remove qpid-tools package [\#21](https://github.com/theforeman/puppet-qpid/pull/21) ([beav](https://github.com/beav))
- Updates from modulesync. [\#20](https://github.com/theforeman/puppet-qpid/pull/20) ([ehelms](https://github.com/ehelms))
- Make router packages configurable [\#18](https://github.com/theforeman/puppet-qpid/pull/18) ([stbenjam](https://github.com/stbenjam))

## [1.0.1](https://github.com/theforeman/puppet-qpid/tree/1.0.1) (2015-02-24)

[Full Changelog](https://github.com/theforeman/puppet-qpid/compare/1.0.0...1.0.1)

**Merged pull requests:**

- Address feedback from puppet forge [\#16](https://github.com/theforeman/puppet-qpid/pull/16) ([stbenjam](https://github.com/stbenjam))

## [1.0.0](https://github.com/theforeman/puppet-qpid/tree/1.0.0) (2015-02-20)

[Full Changelog](https://github.com/theforeman/puppet-qpid/compare/e1852768a21d1026e09c320c27188ff03baac1bd...1.0.0)

**Closed issues:**

- require-encryption should be enabled only if ssl is true [\#10](https://github.com/theforeman/puppet-qpid/issues/10)

**Merged pull requests:**

- refs [\#8175](https://projects.theforeman.org/issues/8175) - link router connector is optional [\#17](https://github.com/theforeman/puppet-qpid/pull/17) ([stbenjam](https://github.com/stbenjam))
- refs [\#8175](https://projects.theforeman.org/issues/8175) - Add linkRoutePattern support for dispatch router [\#15](https://github.com/theforeman/puppet-qpid/pull/15) ([stbenjam](https://github.com/stbenjam))
- make package lists configurable [\#14](https://github.com/theforeman/puppet-qpid/pull/14) ([arnoldbechtoldt](https://github.com/arnoldbechtoldt))
- fixes [\#9060](https://projects.theforeman.org/issues/9060), \#8175 - refactor module and support dispatch router  [\#12](https://github.com/theforeman/puppet-qpid/pull/12) ([stbenjam](https://github.com/stbenjam))
- Fixes 7802 - ensure that qpidd and user and group are created [\#11](https://github.com/theforeman/puppet-qpid/pull/11) ([dustints](https://github.com/dustints))
- Refs [\#6736](https://projects.theforeman.org/issues/6736): Add missing files to create basic layout. [\#9](https://github.com/theforeman/puppet-qpid/pull/9) ([ehelms](https://github.com/ehelms))
- Fixes [\#6544](https://projects.theforeman.org/issues/6544) - qpid-cpp-client-dev pkg & qpidc.xml [\#8](https://github.com/theforeman/puppet-qpid/pull/8) ([dustints](https://github.com/dustints))
- Log Qpid errors to syslog. [\#7](https://github.com/theforeman/puppet-qpid/pull/7) ([awood](https://github.com/awood))
- Fixes [\#5798](https://projects.theforeman.org/issues/5798): Create symlink for /etc/qpidd.conf to support versions olde... [\#6](https://github.com/theforeman/puppet-qpid/pull/6) ([ehelms](https://github.com/ehelms))
- Refs [\#5377](https://projects.theforeman.org/issues/5377): Updates to support newer version of Qpid. [\#4](https://github.com/theforeman/puppet-qpid/pull/4) ([ehelms](https://github.com/ehelms))
- Clean-up and parameterizing. [\#3](https://github.com/theforeman/puppet-qpid/pull/3) ([ehelms](https://github.com/ehelms))
- Move certs specific part to puppet-certs module [\#1](https://github.com/theforeman/puppet-qpid/pull/1) ([iNecas](https://github.com/iNecas))


\* *This Changelog was automatically generated by [github_changelog_generator](https://github.com/github-changelog-generator/github-changelog-generator)*
