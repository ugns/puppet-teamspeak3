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

  $dbtype = 'sqlite'

  case $dbtype {
    'sqlite': {
      $dbplugin          = "ts3db_${dbtype}"
      $dbsqlcreatepath   = "create_${dbtype}/"
      $dbpluginparameter = undef
    }
    'mysql': {
      $dbplugin          = "ts3db_${dbtype}"
      $dbsqlcreatepath   = "create_${dbtype}/"
      $dbpluginparameter = "ts3db_${dbtype}.ini"
    }
    default: {
      fail("${dbtype} plugin not supported")
    }
  }

  $service_name = 'teamspeak3'
}
