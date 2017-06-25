include_recipe 'yum-ius'
include_recipe 'php::package'

file "#{node['apache']['dir']}/conf.d/php.conf" do
  action :delete
  backup false
end

apache_module 'php7' do
  conf true
  filename "libphp7.so"
  notifies :restart, 'service[apache2]'
end

file "/etc/php.d/timezone.ini" do
  owner "root"
  group "root"
  mode "0644"
  action :create
  content "date.timezone=\"#{node['tz']}\"\n"
  notifies :restart, 'service[apache2]'
end
