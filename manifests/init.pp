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
class dc_impdb($userdb, $passdb, $namedb, $namesch, $nametbl, $sourceModule='machine') {

  #if $sourceModule == 'machine'{
      include dc_impdb::docker::init
  #}else{
  #    contain dc_impdb::postgresql::init
  #    contain dc_impdb::firewall::init

  #    Class['dc_impdb::postgresql::init'] ->
  #    Class['dc_impdb::firewall::init']
  #}
}
