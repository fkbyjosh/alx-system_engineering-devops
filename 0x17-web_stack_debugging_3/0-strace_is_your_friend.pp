# Fixes bad `phpp` extensions to `php` in the WordPress file `wp-settings.php`.

exec { 'fix-wordpress':
  command => 'sed -i s/phpp/php/g /var/www/html/wp-settings.php',
  path    => ['/bin/', '/usr/bin/'],  # Updated path to include /usr/bin/
  onlyif  => 'grep -q phpp /var/www/html/wp-settings.php',  # Ensure the command runs only if `phpp` exists
}
