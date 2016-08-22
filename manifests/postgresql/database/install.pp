class dc_impdb::postgresql::database::install{
  class { 'postgresql::globals':
    encoding            => 'UTF-8',
    locale              => 'en_US.UTF-8',
    manage_package_repo => true,
    version             => '9.2',
    before              => Class['postgresql::server']
  }
  
  class { 'postgresql::server':
    ip_mask_allow_all_users => '0.0.0.0/0',
    listen_addresses          => '*'
  }
}