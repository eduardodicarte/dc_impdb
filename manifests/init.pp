#
# Class: dc_impdb
# This module manages dc_impdb
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class dc_impdb($userdb, $passdb, $namedb, $namesch, $nametbl) {
  require dc_impdb::postgresql::database::install
  require dc_impdb::postgresql::database::configure
  include dc_impdb::postgresql::rules::configure
  include dc_impdb::postgresql::schemas::configure
  include dc_impdb::postgresql::dump::tables
  
  include dc_impfw
}
