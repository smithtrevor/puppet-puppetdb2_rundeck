# == Class puppetdb2_rundeck::install
#
# This class is called from puppetdb2_rundeck for install.
#
class puppetdb2_rundeck::install {

  package { $::puppetdb2_rundeck::package_name:
    ensure => present,
  }
}
