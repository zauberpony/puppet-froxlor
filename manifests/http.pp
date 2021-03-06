class froxlor::http inherits froxlor::config {

  file { ['/var/customers/webs', '/var/customers/logs']:
    ensure => directory,
    require => File['/var/customers'],
  }

  file { '/var/customers/tmp':
    ensure => directory,
    mode => 1777,
    require => File['/var/customers'],
  }

  file { '/etc/logrotate.d/froxlor':
    mode => 644,
    source => "puppet:///modules/froxlor/logrotate",
  }
}