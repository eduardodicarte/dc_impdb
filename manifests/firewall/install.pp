class dc_impdb::firewall::install {
  include 'firewall'

  package{ 'firewall':
    ensure => purged,
    before => Class["firewall"]
  }
}
