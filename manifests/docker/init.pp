class dc_impdb::docker::init {
  class {'dc_impdb::docker::install':} ->
  class {'dc_impdb::docker::configure':}
}