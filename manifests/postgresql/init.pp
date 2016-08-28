class dc_impdb::postgresql::init{
  include dc_impdb::postgresql::database::install
  include dc_impdb::postgresql::database::configure
  include dc_impdb::postgresql::rules::configure
  include dc_impdb::postgresql::schemas::configure
  include dc_impdb::postgresql::dump::tables
  include dc_impdb::firewall::configure
}