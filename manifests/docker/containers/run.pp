class dc_impdb::docker::containers::run {

  $name_container      = 'impdb'
  $porta_imagem        = 80
  $porta_container     = 8080
  $nome_imagem         = 'impdb'
  $recreate_container  = true
  $stop_container      = false
  $start_container     = false
  $restart_container   = false
  $create_container    = false

  $dctitle = "${name_container}_${porta_container}"

  if $restart_container == true or $stop_container == true or $recreate_container == true{
    exec { "kill_container $dctitle":
    command => "docker kill $dctitle",
    user    => 'root',
    group   => 'root',
    path    => '/usr/bin/',
    onlyif  => "docker ps | grep $dctitle"
  }
}

  if $recreate_container == true {
    exec { "remove_container $dctitle":
      command => "docker rm $dctitle",
      user    => 'root',
      group   => 'root',
      path    => '/usr/bin/',
      onlyif  => "docker ps -a | grep $dctitle"
    }
  }

  if $start_container == true {
    exec { "start_container $dctitle":
      command => "docker start $dctitle",
      user    => 'root',
      group   => 'root',
      path    => '/usr/bin/',
      unless  => "docker ps | grep $dctitle"
    }
  }

if $recreate_container == true or $create_container == true {
    exec { "$dctitle":
      command => "docker run -d --name $dctitle -it -p $porta_container:$porta_imagem $nome_imagem",
      user    => 'root',
      group   => 'root',
      path    => '/usr/bin/',
      unless  => "docker ps -a | grep $dctitle"
    }
  }
}
