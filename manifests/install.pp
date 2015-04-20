# == Class puppetdb2_rundeck::install
#
# This class is called from puppetdb2_rundeck for install.
#
class puppetdb2_rundeck::install {

  package { 'rubygem-sinatra':
    ensure  => present,
  }

  class { '::staging':
    path  => '/tmp/staging',
    owner => 'puppet',
    group => 'puppet',
  }

  staging::file { 'puppetdb2-rundeck.tar.gz':
    source => 'https://github.com/sirloper/puppetdb2-rundeck/archive/1.0.2.tar.gz',
  }

  staging::extract { 'puppetdb2-rundeck.tar.gz':
    target  => $::puppetdb2_rundeck::apache_docroot,
    creates => "${::puppetdb2_rundeck::apache_docroot}/puppetdb2_rundeck",
    require => Staging::File['puppetdb2-rundeck.tar.gz'],
  }

  file { "${::puppetdb2_rundeck::apache_docroot}/puppetdb2_rundeck":
    owner     => 'root',
    group     => $::puppetdb2_rundeck::apache_group,
    mode      => '0640',
    recurse   => true,
    subscribe => Staging::Extract[ 'puppetdb2-rundeck.tar.gz'],
  }

  file { $::puppetdb2_rundeck::apache_docroot:
    ensure  => directory,
    owner   => 'root',
    group   => $::puppetdb2_rundeck::apache_group,
    mode    => '0750',
    require => Group[$::puppetdb2_rundeck::apache_group],
  }


}
