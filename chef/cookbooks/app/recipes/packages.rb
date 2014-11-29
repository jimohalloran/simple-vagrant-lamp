%w{vim-enhanced git-all}.each do |pkg|
  package pkg do
    action :install
  end
end

file "/home/vagrant/.vimrc" do
  owner "vagrant"
  group "vagrant"
  mode "0644"
  action :create
  content "colorscheme murphy\n"
end
