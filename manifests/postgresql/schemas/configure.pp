class dc_impdb::postgresql::schemas::configure {
  postgresql::server::schema {$dc_impdb::namesch:
    db    => $dc_impdb::namedb,
    owner => $dc_impdb::userdb,
  }
}
