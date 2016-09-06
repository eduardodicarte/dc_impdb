class dc_impdb::postgresql::firewall::configure {
    firewall { '000 accept all to all interface in the port 5432':
      proto   => 'tcp',
      dport   => '5432',
      action  => 'accept',
      require => Package['iptables-services'],
      notify  => Service['iptables']
    }
}
