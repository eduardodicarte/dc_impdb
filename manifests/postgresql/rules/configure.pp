class dc_impdb::postgresql::rules::configure {
  
  $database = $dc_impdb::namedb
  
   postgresql::server::pg_hba_rule {'allow application network to access $database database':
    type        => 'host',
    database    => $database,
    user        => $dc_impdb::userdb,
    address     => '0.0.0.0/0',
    auth_method => 'md5'
  }
}