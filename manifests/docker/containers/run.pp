class dc_impdb::docker::containers::run {
  docker::run { 'run_impdb':
    image           => 'impdb',
    ports           => ['5432'],
    expose          => ['2343'],
    dns             => ['8.8.8.8','8.8.4.4'],
    restart_service => true,
    before_stop     => 'echo "So long, and Thanks for All the Fish"'
  }
}
