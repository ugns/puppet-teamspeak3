# == Class: teamspeak3
#
# Full description of class teamspeak3 here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class teamspeak3 (
) inherits teamspeak3::params {

  # validate parameters here

  class { 'teamspeak3::install': } ->
  class { 'teamspeak3::config': } ~>
  class { 'teamspeak3::service': } ->
  Class['teamspeak3']
}
