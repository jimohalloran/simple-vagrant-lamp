web_app "app" do
  server_name node['app']['url']['host']
  server_aliases [node['fqdn'], node['hostname']]
  docroot node['app']['docroot']
  allow_override "All"
  ssl node['app']['ssl']['enabled']
  notifies :restart, resources(:service => "apache2")
end


#template "#{node['app']['base']}/application/.env" do
#  source "dotenv.erb"
#  #mode 0644
#  #owner "vagrant"
#  #group "vagrant"
#end