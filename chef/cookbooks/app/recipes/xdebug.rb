template "/etc/php.d/xdebug.ini" do
  source "xdebug.ini.erb"
  mode 0644
  owner "root"
  group "root"
  notifies :restart, 'service[apache2]'
end