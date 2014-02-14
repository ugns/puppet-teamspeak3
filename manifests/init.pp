# == Class: teamspeak3
#
# Full description of class teamspeak3 here.
#
# === Parameters
#
# [*version*]
#   Version of Teamspeak server to deploy, defaults to 3.0.10.3
#
# [*basedir*]
#   Base directory to install Teamspeak under, defaults to /opt
#
# [*user*]
#   (String) User to run Teamspeak server as
#   Defaults to tspeak3
#
# [*default_voice_port*]
#   (Integer) UDP Port for incoming voice connections
#   Defaults to 9987
#
# [*voice_ip*]
#   (String) IP address bound for incoming Voice connections
#   Defaults to '0.0.0.0'
#
# [*filetransfer_port*]
#   (Integer) TCP Port for file transfer connections
#   Defaults to 30033
#
# [*filetransfer_ip*]
#   (String) IP address bound for file transfer connections
#   Defaults to '0.0.0.0'
#
# [*query_port*]
#   (Integer) TCP Port for ServerQuery connections
#   Defaults to 10011
#
# [*query_ip*]
#   (String) IP address bound for ServerQuery connections
#   Defaults to '0.0.0.0'
#
# [*logpath*]
#   (String) Physical path where to create log files
#   Defaults to 'logs/'
#
# [*dbtype*]
#   (String) Teamspeak supported database type to use
#   Defaults to 'sqlite'
#
# [*dbplugin*]
#   (String) Name of the database plugin
#   Defaults to 'ts3db_sqlite3'
#
# [*dbpluginparameter*]
#   (String) Custom parameter file passed to database plugin
#   Defaults to undef
#
# [*dbsqlpath*]
#   (String) Physical path to SQL script files
#   Defaults to 'sql/'
#
# [*dbsqlcreatepath*]
#   (String) Physical path to SQL installation files
#   Defaults to 'create_sqlite/'
#
# [*licensepath*]
#   (String) Physical path to license file
#   Defaults to undef
#
# [*inifile*]
#   (String) Physical path to config file
#   Defaults to 'ts3server.ini'
#
# [*whitelist*]
#   (Array) Whitelisted IP addresses for ServerQuery interface
#   Defaults to 127.0.0.1
#
# [*blacklist*]
#   (Array) Blacklisted IP addresses for ServerQuery interface
#   Defaults to undef
#
# [*dbclientkeepdays*]
#   (Integer) Number of days to keep unused client identifiers
#   Defaults to 90
#
# [*dblogkeepdays*]
#   (Integer) Number of days to keep database log entries
#   Defaults to 90
#
# [*dbconnections*]
#   (Integer) Number of database connections used by server.
#   Defaults to 10
#
# [*dbparams*]
#   (Hash) Settings for database plugin parameters file
#   Defaults to undef
#
class teamspeak3 (
  $version            = '3.0.10.3',
  $basedir            = '/opt',
  $user               = 'tspeak3',
  $default_voice_port = 9987,
  $voice_ip           = '0.0.0.0',
  $filetransfer_port  = 30033,
  $filetransfer_ip    = '0.0.0.0',
  $query_port         = 10011,
  $query_ip           = '0.0.0.0',
  $logpath            = 'logs',
  $dbtype             = 'sqlite',
  $dbplugin           = $teamspeak3::params::dbplugin,
  $dbpluginparameter  = $teamspeak3::params::dbpluginparameter,
  $dbsqlpath          = 'sql/',
  $dbsqlcreatepath    = $teamspeak3::params::dbsqlcreatepath,
  $licensepath        = undef,
  $inifile            = 'ts3server.ini',
  $whitelist          = ['127.0.0.1'],
  $blacklist          = [],
  $dbclientkeepdays   = 90,
  $dblogkeepdays      = 90,
  $dbconnections      = 10,
  $dbparams           = {},
) inherits teamspeak3::params {

  # validate parameters here

  class { 'teamspeak3::install': } ->
  class { 'teamspeak3::config': } ~>
  class { 'teamspeak3::service': } ->
  Class['teamspeak3']
}
