include_recipe "database::mysql"

mysql_connection_info = {
	:host => 'localhost',
	:username => 'root',
	:password => node['mysql']['server_root_password']
}

mysql_database node['app']['mysql']['database']  do
	connection mysql_connection_info
	action :create
end

mysql_database_user node['app']['mysql']['application']['username'] do
	connection mysql_connection_info
	password node['app']['mysql']['application']['password']
	database_name node['app']['mysql']['database']
	host node['app']['mysql']['application']['acl']
	privileges [:all]
	action :grant
end

mysql_database_user node['app']['mysql']['admin']['username'] do
	connection mysql_connection_info
	password node['app']['mysql']['admin']['password']
	host node['app']['mysql']['admin']['acl']
	privileges [:all]
	action :grant
	grant_option true
end