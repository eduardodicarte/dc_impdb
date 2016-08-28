#
# Class: dc_impdb
# This module manages the database postgres from the module puppetlabs-postgres 
#
# Parameters: $userdb, #passdb, $namedb, $namesch, $nametbl
#
# Actions: 
#
# Requires: see Modulefile
#
# Sample Usage: class {'dc_impdb':userdb => admin,passdb => admin,namedb => mydb,namesch => mysch, nametbl => mytbl} 
#  
class dc_impdb($userdb, $passdb, $namedb, $namesch, $nametbl) {
  include dc_impdb::postgresql::init
  include dc_impdb::firewall::init
}
