class rvm($version='latest') {
  include stdlib
  
  anchor { 'rvm::begin': }
  anchor { 'rvm::end': }
  
  class { 'rvm::packages':
    version => $version,
    require => Anchor['rvm::begin'],
    before  => Class['rvm::config'],
  }
  class { 'rvm::config': 
    before => Anchor['rvm::end'],
  }
}
