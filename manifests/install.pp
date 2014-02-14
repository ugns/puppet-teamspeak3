# == Class teamspeak3::install
#
class teamspeak3::install {
  include teamspeak3::params

  if ! defined( staging ) {
    class { 'staging': }
  }

  $release_dir  = "teamspeak3-server_linux-${teamspeak3::params::ts3_arch}"
  $release_file = "${release_dir}-${teamspeak3::version}.tar.gz"

  staging::deploy { $release_file:
    source  => "http://files.teamspeak-services.com/releases/${teamspeak3::version}/${release_file}",
    target  => $teamspeak3::basedir,
    creates => "${teamspeak3::basedir}/${release_dir}",
  }
}
