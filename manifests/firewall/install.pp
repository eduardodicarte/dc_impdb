class dc_impdb::firewall::install {
  class {'firewall':
    require => Class['dc_impdb::postgresql::dump::tables']
  }

  resources{ 'firewall':
    purge => true,
    require => Class["firewall"]
  }
}
