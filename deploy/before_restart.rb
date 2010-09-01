# before_restart.rb

node[:applications].each do |app_name,data|

  sudo "cat /data/#{app_name}/current/cookbooks/wordpress/files/default/spawn-fcgi-php > /etc/init.d/spawn-fcgi-php"
  sudo "chmod 755 /etc/init.d/spawn-fcgi-php"

  # setup wp-config.php file
  "erubis cookbooks/wordpress/templates/default/wp-config.php.erb > /data/#{app_name}/shared/config/wp-config.php"
  
  # setup wordpress.conf file
  "erubis cookbooks/wordpress/templates/default/wordpress.conf.erb > /etc/nginx/servers/#{app_name}-chef.conf"

end

