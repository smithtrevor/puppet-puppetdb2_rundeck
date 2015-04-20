# == Class puppetdb2_rundeck::service
#
# This class is meant to be called from puppetdb2_rundeck.
# It ensure the service is running.
#
class puppetdb2_rundeck::service {

  service { $::puppetdb2_rundeck::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
