default['app']['mysql']['host'] = 'localhost'
default['app']['mysql']['database'] = 'app'

default['app']['mysql']['application']['username'] = 'app'
default['app']['mysql']['application']['password'] = 'Password1'
default['app']['mysql']['application']['acl'] = 'localhost'

default['app']['mysql']['admin']['username'] = 'appadmin'
default['app']['mysql']['admin']['password'] = 'Password1'
default['app']['mysql']['admin']['acl'] = 'localhost'

default['app']['base'] = '/vagrant'
default['app']['docroot'] = "#{node['app']['base']}"

default['app']['ssl']['enabled'] = true

default['app']['url']['host'] = "#{node['fqdn']}"
default['app']['url']['base'] = "http://#{node['app']['url']['host']}/"
default['app']['url']['indexpage'] = ""
