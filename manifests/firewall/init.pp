class dc_impdb::firewall::init{
  contain dc_impdb::firewall::install
  contain dc_impdb::firewall::configure

  Class['dc_impdb::firewall::install'] ->
  Class['dc_impdb::firewall::configure']
}
