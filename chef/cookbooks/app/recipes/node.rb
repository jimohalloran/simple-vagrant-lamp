include_recipe 'nodejs'

file "/etc/profile.d/nodepath.sh" do
  mode 0755
  user "root"
  group "root"
  content "PATH=$PATH:/usr/local/nodejs-binary-6.10.0/bin\n"
end

#nodejs_npm "npm" do
#  version "3"
#  user "vagrant"
#end
#
#nodejs_npm "gulp" do
#  user "vagrant"
#end
#
#nodejs_npm "jspm" do
#  user "vagrant"
#end