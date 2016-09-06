class dc_impdb::postgresql::init{
  require dc_impdb::postgresql::database::install
  require dc_impdb::postgresql::database::configure
  require dc_impdb::postgresql::rules::configure
  require dc_impdb::postgresql::schemas::configure
  require dc_impdb::postgresql::dump::tables
  require dc_impdb::firewall::configure


  Class['dc_impdb::postgresql::database::install']   ->
  Class['dc_impdb::postgresql::database::configure'] ->
  Class['dc_impdb::postgresql::rules::configure']    ->
  Class['dc_impdb::postgresql::schemas::configure']  ->
  Class['dc_impdb::postgresql::dump::tables']        ->
  Class['dc_impdb::firewall::configure']
}
