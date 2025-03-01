# Fixes bad `phpp` extensions to `php` in the WordPress file `wp-settings.php`.
exec { 'fix-wordpress':
  command => 'sed -i s/phpp/php/g /var/www/html/wp-settings.php',
  path    => ['/bin/', '/usr/bin/'],
  onlyif  => 'grep -q phpp /var/www/html/wp-settings.php',
}

# Ensure Apache service is running and is restarted after the WordPress fix
service { 'apache2':
  ensure     => running,
  enable     => true,
  require    => Exec['fix-wordpress'],
  restart    => true,
}
