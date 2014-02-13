# == Class teamspeak3::params
#
# This class is meant to be called from teamspeak3
# It sets variables according to platform
#
class teamspeak3::params {
  case $::kernel {
    'Linux': {
      $ts3_startscript = 'ts3server_startscript.sh'
    }
    default: {
      fail("${::kernel} not supported")
    }
  }

  case $::architecture {
    'amd64': {
      $ts3_arch = 'amd64'
    }
    'i386': {
      $ts3_arch = 'x86'
    }
    default: {
      fail("${::architecture} not supported")
    }
  }

  case $teamspeak3::dbtype {
    'sqlite': {
      $dbplugin          = "ts3db_${teamspeak3::dbtype}"
      $dbsqlcreatepath   = "create_${teamspeak3::dbtype}/"
      $dbpluginparameter = undef
    }
    'mysql': {
      $dbplugin          = "ts3db_${teamspeak3::dbtype}"
      $dbsqlcreatepath   = "create_${teamspeak3::dbtype}/"
      $dbpluginparameter = "ts3db_${teamspeak3::dbtype}.ini"
    }
    default: {
      fail("${teamspeak3::dbtype} not supported")
    }
  }

  $service_name = 'teamspeak3'
}
