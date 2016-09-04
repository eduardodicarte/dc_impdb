class dc_impdb::docker::configure {
  docker::image {'impdb':
    image_tag   => '1',
    docker_dir  => '/tmp/',
    subscribe   => File['/tmp/Dockerfile'],
    require     => Service['docker']
  }
  
  file { '/tmp/Dockerfile':
    ensure => file,
    source => 'puppet:///modules/dc_impdb/Dockerfile',
    require => [File['/tmp/Puppetfile'],File['/tmp/site.pp']]
  }
  
  file { '/tmp/Puppetfile':
    ensure => file,
    source => 'puppet:///modules/dc_impdb/Puppetfile'
  }
  
  file{'/tmp/site.pp':
    ensure => file,
    source => 'puppet:///modules/dc_impdb/site.pp'
  }
}