# Class cis::linuxcontgrols::c0068
#
# Restrict access to the SSH daemon configuration file.
#

class cis::linuxcontrols::c0068 {
  case $::operatingsystem {
    'RedHat': {
      file { '/etc/ssh/sshd_config':
        ensure => present,
        source => 'puppet:///modules/cis/el6/etc/ssh/sshd_config',
        owner  => root,
        group  => root,
        mode   => '0600',
      }
    }
    'Amazon': {
      file { '/etc/ssh/sshd_config':
        ensure => present,
        source => 'puppet:///modules/cis/awslinux/etc/ssh/sshd_config',
        owner  => root,
        group  => root,
        mode   => '0600',
      }
    }
    default: { fail("ERROR: unsupported OS = ${::operatingsystem}") }
  }
}
