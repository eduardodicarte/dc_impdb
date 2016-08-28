class dc_impdb::firewall::install {
  class {'firewall':
    require => Dc_impdb::Postgresql::Dump::Tables
  }
  
  resources{ 'firewall':
    purge => true,
    require => Class["firewall"]
  }
}