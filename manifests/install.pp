# == Class teamspeak3::install
#
class teamspeak3::install {
  include teamspeak3::params

  package { $teamspeak3::params::package_name:
    ensure => present,
  }
}
