# == Class: puppetdb2_rundeck
#
# Full description of class puppetdb2_rundeck here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class puppetdb2_rundeck (
  $package_name = $::puppetdb2_rundeck::params::package_name,
  $service_name = $::puppetdb2_rundeck::params::service_name,
) inherits ::puppetdb2_rundeck::params {

  # validate parameters here

  class { '::puppetdb2_rundeck::install': } ->
  class { '::puppetdb2_rundeck::config': } ~>
  class { '::puppetdb2_rundeck::service': } ->
  Class['::puppetdb2_rundeck']
}
