# The teamspeak3 default configuration settings
class teamspeak3::params {
  $version           = '3.0.12'
  $user              = 'tspeak3'
  $group             = 'nogroup'
  $basedir           = '/opt/teamspeak3'
  $voice_port        = '9987'
  $voice_address     = '0.0.0.0'
  $transfer_port     = '30033'
  $transfer_address  = '0.0.0.0'
  $query_port        = '10011'
  $query_address     = '0.0.0.0'
  $log_path          = '/var/log/teamspeak3'
  $clear_database    = false
  $database          = 'sqlite'
  $dbsqlpath         = "${basedir}/sql/"
  case $database {
    'mysql': {
      $dbplugin        = 'ts3db_mysql'
      $dbsqlcreatepath = 'create_mysql/'
    }
    default: {
      $dbplugin        = 'ts3db_sqlite3'
      $dbsqlcreatepath = 'create_sqlite/'
    }
  }
  $dbconnections     = '10'
}
