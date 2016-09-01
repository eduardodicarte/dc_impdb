class dc_impdb::docker::configure {
  docker::image {'centos':
    #tag         => '7',
    docker_file => '/tmp/Dockerfile',
    subscribe   => File['/tmp/Dockerfile'],
    require     => Service['docker']
  }
  
  file { '/tmp/Dockerfile':
    ensure => file,
    source => 'puppet:///modules/dc_impdb/Dockerfile'
  }
}