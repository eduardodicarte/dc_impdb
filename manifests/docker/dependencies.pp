class dc_impdb::docker::dependencies {
  package {'epel-release':
    ensure => 'latest'
  } ->
  package {'centos-release':
    ensure => 'latest'
  } ->
  package {'kernel':
    ensure => 'latest'
  } ->
  package {'deltarpm':
    ensure => 'latest'
  } ->
  package {'lvm2':
    ensure => 'latest'
  }
}