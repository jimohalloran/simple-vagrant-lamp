default['app']['base'] = '/vagrant'
default['app']['docroot'] = "#{node['app']['base']}/public"

default['app']['ssl']['enabled'] = true

default['app']['url']['host'] = "#{node['fqdn']}"
default['app']['url']['base'] = "http://#{node['app']['url']['host']}/"
default['app']['url']['indexpage'] = ""

default['nodejs']['engine'] = 'node'
default['nodejs']['version'] = '6.11.0'
default['nodejs']['binary']['checksum']['linux_x64'] = '2b0e1b06bf8658ce02c16239eb6a74b55ad92d4fb7888608af1d52b383642c3c'
default['nodejs']['install_method'] = 'binary'