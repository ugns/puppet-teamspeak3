# == Class teamspeak3::params
#
# This class is meant to be called from teamspeak3
# It sets variables according to platform
#
class teamspeak3::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'teamspeak3'
      $service_name = 'teamspeak3'
    }
    'RedHat', 'Amazon': {
      $package_name = 'teamspeak3'
      $service_name = 'teamspeak3'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
