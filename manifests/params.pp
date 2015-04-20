# == Class puppetdb2_rundeck::params
#
# This class is meant to be called from puppetdb2_rundeck.
# It sets variables according to platform.
#
class puppetdb2_rundeck::params {
  $package_source = 'https://github.com/sirloper/puppetdb2-rundeck/archive/1.0.2.tar.gz'

  $apache_serveradmin = "root@${::fqdn}"

  $ssl_params_hash = {
    'ssl_cert'             => getvar(::apache::default_ssl_cert),
    'ssl_key'              => getvar(::apache::default_ssl_key),
    'ssl_chain'            => getvar(::apache::default_ssl_chain),
    'ssl_ca'               => getvar(::apache::default_ssl_ca),
    'ssl_crl_path'         => getvar(::apache::default_ssl_crl_path),
    'ssl_crl'              => getvar(::apache::default_ssl_crl),
    'ssl_certs_dir'        => getvar(::apache::params::ssl_certs_dir),
    'ssl_protocol'         => undef,
    'ssl_cipher'           => undef,
    'ssl_honorcipherorder' => undef,
    'ssl_verify_client'    => undef,
    'ssl_verify_depth'     => undef,
    'ssl_options'          => undef,
    'ssl_proxyengine'      => undef,
  }

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
