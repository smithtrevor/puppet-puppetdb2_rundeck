# == Class puppetdb2_rundeck::params
#
# This class is meant to be called from puppetdb2_rundeck.
# It sets variables according to platform.
#
class puppetdb2_rundeck::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'puppetdb2_rundeck'
      $service_name = 'puppetdb2_rundeck'
    }
    'RedHat', 'Amazon': {
      $package_name = 'puppetdb2_rundeck'
      $service_name = 'puppetdb2_rundeck'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
