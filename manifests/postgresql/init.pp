class dc_impdb::postgresql::init{
  contain dc_impdb::postgresql::database::install
  contain dc_impdb::postgresql::database::configure
  contain dc_impdb::postgresql::schemas::configure
  contain dc_impdb::postgresql::dump::tables

  Class['dc_impdb::postgresql::database::install']   ->
  Class['dc_impdb::postgresql::database::configure'] ->
  Class['dc_impdb::postgresql::schemas::configure']  ->
  Class['dc_impdb::postgresql::dump::tables'] 
}
