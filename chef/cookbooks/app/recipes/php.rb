%w{php-cli php-pdo php-mbstring php-mcrypt php-mysql php-soap php-gd php-pear php-xml php-devel}.each do |pkg|
  package pkg do
    action :install
  end
end

file "/etc/php.d/timezone.ini" do
  owner "root"
  group "root"
  mode "0644"
  action :create
  content "date.timezone=\"#{node['tz']}\"\n"
  notifies :restart, 'service[apache2]'
end
