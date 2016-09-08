class dc_impdb::docker::configure {
  docker::image {'impdb':
    docker_dir  => '/tmp/',
    subscribe   => File['/tmp/Dockerfile'],
    require     => Service['docker']
  }

  file { '/tmp/Dockerfile':
    ensure => file,
    source => 'puppet:///modules/dc_impdb/Dockerfile',
    require => [File['/tmp/Puppetfile'],File['/tmp/site.pp'],File['/tmp/sources.list']]
  }

  file { '/tmp/Puppetfile':
    ensure => file,
    source => 'puppet:///modules/dc_impdb/Puppetfile'
  }

  file{'/tmp/site.pp':
    ensure => file,
    source => 'puppet:///modules/dc_impdb/site.pp'
  }

  file{'/tmp/sources.list':
    ensure => file,
    source => 'puppet:///modules/dc_impdb/sources.list'
  }
}
