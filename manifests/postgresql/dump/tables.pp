class dc_impdb::postgresql::dump::tables {
  
  $sql_table_test = "select * from $dc_impdb::nametbl"
  
  file { '/tmp/generate_tables.sql':
    ensure  => file,
    owner   => 'postgres',
    group   => 'root',
    mode    => '0770',
    source  => 'puppet:///modules/dc_impdb/generate_tables.sql',
    require => Postgresql::Server::Schema[$dc_impdb::namesch]
  }
  
  exec {"generate tables":
    command  => "psql -d $dc_impdb::namedb < generate_tables.sql",
    cwd     => '/tmp',
    path    => '/usr/bin',
    user    => 'postgres',    
    unless => "psql -d $dc_impdb::namedb -c $sql_table_test",
    require => File['/tmp/generate_tables.sql']
  }  
}