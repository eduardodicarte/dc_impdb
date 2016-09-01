class dc_impdb::docker::install {
  class {'docker':
    use_upstream_package_source => false,
    package_name                => 'docker'
  }
}