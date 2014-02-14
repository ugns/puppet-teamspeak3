# == Class teamspeak3::service
#
# This class is meant to be called from teamspeak3
# It ensure the service is running
#
class teamspeak3::service {
  include teamspeak3::params

#  service { $teamspeak3::params::service_name:
#    ensure     => running,
#    enable     => true,
#    hasstatus  => true,
#    hasrestart => true,
#  }
}
