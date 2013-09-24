# == Class: teamspeak3
#
# Full description of class teamspeak3 here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*version*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { teamspeak3:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2013 Your name here, unless otherwise noted.
#
class teamspeak3(
  $version           = $teamspeak3::params::version,
  $basedir           = $teamspeak3::params::basedir,
  $voice_port        = $teamspeak3::params::voice_port,
  $voice_address     = $teamspeak3::params::voice_address,
  $transfer_port     = $teamspeak3::params::transfer_port,
  $transfer_address  = $teamspeak3::params::transfer_address,
  $query_port        = $teamspeak3::params::query_port,
  $query_address     = $teamspeak3::params::query_address,
  $log_path          = $teamspeak3::params::log_path,
  $clear_database    = $teamspeak3::params::clear_database,
  $database          = $teamspeak3::params::database,
  $dbplugin          = $teamspeak3::params::dbplugin,
  $dbpluginparameter = $teamspeak3::params::dbpluginparameter,
  $dbsqlpath         = $teamspeak3::params::dbsqlpath,
  $dbsqlcreatepath   = $teamspeak3::params::dbsqlcreatepath,
  $dbconnections     = $teamspeak3::params::dbconnections
) inherits teamspeak3::params {

  validate_re ($version, ['^([\d,\.])+'],
    "version is <${version}> which does not match the validation")

  validate_bool ($clear_database)

  validate_re ($database, ['^sqlite$','^mysql$'],
    "database is <${database}> which does not match sqlite or mysql")

  validate_re ($voice_port, ['^(\d)+'],
    "voice_port is <${voice_port}> which does not match the validation")
  validate_re ($transfer_port, ['^(\d)+'],
    "transfer_port is <${transfer_port}> which does not match the validation")
  validate_re ($query_port, ['^(\d)+'],
    "query_port is <${query_port}> which does not match the validation")

  validate_re ($voice_address, ['^[\d,\.]+$'],
    "voice_address is <${voice_address}> which does not match the validation")
  validate_re ($transfer_address, ['^[\d,\.]+$'],
    "transfer_address is <${transfer_address}> which does not match the validation")
  validate_re ($query_address, ['^[\d,\.]+$'],
    "query_address is <${query_address}> which does not match the validation")

  validate_re ($dbconnections, ['^[2-9]$','^[0-9][0-9]$','^100$'],
    "dbconnections is <${dbconnections}> which does not match the validation")
}
