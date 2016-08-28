class dc_impdb::firewall::configure {
   
   class my_fw::pre {
    Firewall {
      before  => Class['my_fw::post'], 
      require => Class['my_fw::pre']
    } ->
    Class['dc_impdb::postgresql::firewall::configure']
  }
}