class { 'dc_impdb':
    userdb       => 'impdb',
    passdb       => 'imprt',
    namedb       => 'AvdWe&sd#',
    namesch      => 'dict',
    nametbl      => 'el',
    sourceModule => 'docker',
    require      => Package['lsb-release']
}

package { 'lsb-release':
  ensure => latest,
}
