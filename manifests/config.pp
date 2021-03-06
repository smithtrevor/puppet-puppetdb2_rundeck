# == Class puppetdb2_rundeck::config
#
# This class is called from puppetdb2_rundeck for service config.
#
class puppetdb2_rundeck::config {

  assert_private()

  if $::puppetdb2_rundeck::manage_vhost {
    
    apache::vhost { 'puppetdb2_rundeck':
      ip                => '*',
      port              => '8888',
      servername        => $::puppetdb2_rundeck::site_fqdn,
      ssl               => false,
      ip_based          => false,
      access_log_format => 'combined',
      docroot           => "${::puppetdb2_rundeck::apache_docroot}/puppetdb2-rundeck-${::puppetdb2_rundeck::version}/public",
      directories       => [
        {
          path           => "$::puppetdb2_rundeck::apache_docroot/puppetdb2-rundeck-${::puppetdb2_rundeck::version}",
          allow_override => 'None',
          options        => 'None',
        },
        {
          path           => "${::puppetdb2_rundeck::apache_docroot}/puppetdb2-rundeck-${::puppetdb2_rundeck::version}/public",
          allow_override => 'None',
          options        => 'None',
        }
      ],
    }
  }
      
}
