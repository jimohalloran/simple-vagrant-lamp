# install the xdebug pecl
php_pear "xdebug" do
  # Specify that xdebug.so must be loaded as a zend extension
  zend_extensions ['xdebug.so']
  action :install
end

template "/etc/php.d/xdebug.ini" do
  source "xdebug.ini.erb"
  mode 0644
  owner "root"
  group "root"
  notifies :restart, 'service[apache2]'
end