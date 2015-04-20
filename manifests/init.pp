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
  $apache_docroot         = $::phpipam::params::apache_docroot,         # document root for apache this is the parent directory to the phpipam docroot
  $apache_user            = $::phpipam::params::apache_user,            # user account under which the httpd processes run
  $apache_group           = $::phpipam::params::apache_group,           # group account for the apache_user
  $package_source         = $::phpipam::params::package_source,         # source url for the phpipam archive
  $manage_apache          = true,                                       # boolean flag for enabling this module to manage apache
  $apache_server_root     = $::phpipam::params::apache_server_root,     # the root directory for the httpd configuration files
  $apache_serveradmin     = $::phpipam::params::apache_serveradmin,     # serveradmin value as set in the vhost configuration
  $site_fqdn              = $::fqdn,                                    # fully qualified domain name for the web site
) inherits ::puppetdb2_rundeck::params {

  # validate parameters here

  class { '::puppetdb2_rundeck::install': } ->
  class { '::puppetdb2_rundeck::config': } ~>
  class { '::puppetdb2_rundeck::service': } ->
  Class['::puppetdb2_rundeck']
}
