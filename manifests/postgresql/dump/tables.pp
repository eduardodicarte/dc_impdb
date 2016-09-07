class dc_impdb::postgresql::dump::tables {
  contain dc_impdb::postgresql::firewall::configure 

  $sql_table_test = "select * from $dc_impdb::nametbl"

  file { '/tmp/generate_tables.sql':
    ensure  => file,
    owner   => 'postgres',
    group   => 'root',
    mode    => '0770',
    source  => 'puppet:///modules/dc_impdb/generate_tables.sql',
  }

  exec {"generate tables":
    command  => "psql -d $dc_impdb::namedb < generate_tables.sql",
    cwd     => '/tmp',
    path    => '/usr/bin',
    user    => 'postgres',
    unless => "psql -d $dc_impdb::namedb -c $sql_table_test",
    require => File['/tmp/generate_tables.sql'],
  } ->
  Class['dc_impdb::postgresql::firewall::configure']
}
