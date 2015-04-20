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
  $apache_docroot         = $::puppetdb2_rundeck::params::apache_docroot,         # document root for apache this is the parent directory to the puppetdb2_rundeck docroot
  $apache_user            = $::puppetdb2_rundeck::params::apache_user,            # user account under which the httpd processes run
  $apache_group           = $::puppetdb2_rundeck::params::apache_group,           # group account for the apache_user
  $package_source         = $::puppetdb2_rundeck::params::package_source,         # source url for the puppetdb2_rundeck archive
  $manage_apache          = true,                                       # boolean flag for enabling this module to manage apache
  $manage_vhost           = true,                                       # boolean flag for enabling this module to manage the virtual host
  $apache_server_root     = $::puppetdb2_rundeck::params::apache_server_root,     # the root directory for the httpd configuration files
  $apache_serveradmin     = $::puppetdb2_rundeck::params::apache_serveradmin,     # serveradmin value as set in the vhost configuration
  $site_fqdn              = $::fqdn,                                    # fully qualified domain name for the web site
  $version                = '1.0.2',                                              # version of the plugin to install from github
) inherits ::puppetdb2_rundeck::params {

  # validate parameters here

  class { '::puppetdb2_rundeck::install': } ->
  class { '::puppetdb2_rundeck::config': } ->
  Class['::puppetdb2_rundeck']
}
