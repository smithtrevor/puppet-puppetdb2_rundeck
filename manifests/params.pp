# == Class puppetdb2_rundeck::params
#
# This class is meant to be called from puppetdb2_rundeck.
# It sets variables according to platform.
#
class puppetdb2_rundeck::params {
  $package_source = 'https://github.com/sirloper/puppetdb2-rundeck/archive/1.0.2.tar.gz'

  $apache_serveradmin = "root@${::fqdn}"

  case $::osfamily {
    'RedHat', 'Amazon': {
      $apache_docroot = '/var/www/html'
      $apache_user = 'apache'
      $apache_group = 'apache'
      $apache_server_root = '/etc/httpd'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }

}
