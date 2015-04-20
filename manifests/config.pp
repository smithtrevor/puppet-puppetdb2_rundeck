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
      docroot           => "${::puppetdb2_rundeck::apache_docroot}/puppetdb2_rundeck",
      directories       => [
        {
          path           => '/',
          allow_override => 'None',
          options        => 'Indexes -Multiviews',
          order          => 'allow,deny',
          allow          => 'from all',
        },
        {
          path           => '/public',
          allow_override => 'None',
          options        => 'None',
          order          => 'allow,deny',
          allow          => 'from all',
        }
      ],
    }
  }
      
}
