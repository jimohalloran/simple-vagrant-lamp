#
## Cookbook Name:: app
## Recipe:: mysql
##
## Copyright 2016, Tux IT Services
##
#

# SELinux enforcing breaks the custom mysql stuff the musql cookbook sets up
include_recipe 'selinux::permissive'

include_recipe 'yum-mysql-community::mysql57'


mysql_client 'default' do
  version node['mysql']['server_version']
  action :create
end

mysql_service 'default' do
  version node['mysql']['server_version']
  bind_address '0.0.0.0'
  port '3306'
  data_dir '/var/lib/mysql'
  initial_root_password node['mysql']['server_root_password']
  action [:create, :start]
end

package 'mysql-community-devel' do
  version '5.7.18-1.el7'
  action :install
end

mysql2_chef_gem 'default' do
  package_version node['mysql']['server_version']
  action :install
end

mysql_connection_info = {
	:host => '127.0.0.1',
	:username => 'root',
	:password => node['mysql']['server_root_password']
}

node['app']['mysql'].each do |key, db|
    mysql_database "#{db['database']}" do
        connection mysql_connection_info
        action :create
    end

    mysql_database_user "#{db['username']}" do
        connection mysql_connection_info
        password db['password']
        database_name db['database']
        host db['acl']
        privileges [:all]
        action :grant
    end
end