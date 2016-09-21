class dc_impdb::postgresql::dump::migrate {

https://github.com/EnglishLesson/dc_templatedb
  vcsrepo { '/tmp/dc_templatedb':
    ensure   => present,
    provider => git,
    remote   => 'origin'
    source   => {'origin'       => 'https://github.com/EnglishLesson/dc_templatedb.git'},
    require => Firewall ['000 accept all to all interface in the port 5432']
  } ->
  vcsrepo { '/tmp/dc_procxls':
  ensure   => present,
  provider => git,
  remote   => 'origin'
  source   => {'origin'       => 'https://github.com/EnglishLesson/dc_procxls.git'},
  } ->
  package { 'ruby':
    ensure => present
  } ->
  exec {'proc_xls':
    command => 'ruby main.rb',
    cwd     => '/tmp/dc_procxls',
    path    => '/usr/bin',
    user    => 'root',
    group   => 'root'
  }
}
