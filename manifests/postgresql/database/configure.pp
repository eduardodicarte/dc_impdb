class dc_impdb::postgresql::database::configure {
   postgresql::server::role{ $dc_impdb::userdb:
      password_hash => $dc_impdb::passdb,
      superuser     => true,
      require       => [
                          Class['postgresql::globals'],
                          Class['postgresql::server::service'],
                          Class['dc_impdb::postgresql::database::install']
                       ]
  }
  
  postgresql::server::db { $dc_impdb::namedb:
     user     => $dc_impdb::userdb,
     password => postgresql_password($dc_impdb::userdb,$dc_impdb::passdb)
  }
}