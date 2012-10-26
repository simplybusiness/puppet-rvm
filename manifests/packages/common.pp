class rvm::packages::common($version='latest') {
  Exec {
    path => '/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/rvm/bin',
  }
  
  exec { 'download-rvm-install':
    command => 'wget -O /tmp/rvm https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer',
    creates => '/tmp/rvm',
    unless  => 'which rvm',
  }
  exec { 'install-rvm':
    command => "bash /tmp/rvm --version $version",
    creates => '/usr/local/rvm/bin/rvm',
    require => Exec['download-rvm-install'],
  }
  file { '/tmp/rvm':
    ensure  => absent,
    require => Exec['install-rvm'],
  }
}
