name "app"
maintainer       "Jim O'Halloran"
maintainer_email "jim@tuxit.com.au"
license          "Apache 2.0"
description      "Application"
long_description "Application"
version          "0.0.1"

%w[ centos ].each do |os|
  supports os
end

depends 'apache2', '~> 2.0.0'
depends 'database', '~> 5.1.2'
depends 'mysql', '~> 8.0.3'
depends 'mysql2_chef_gem', '~> 2.0.1'
depends 'php', '~> 4.2.0'
depends 'selinux', '~> 2.0.3'
depends 'yum-mysql-community', '~> 1.0.0'
depends 'yum-ius', '~> 0.4.5'
depends 'nodejs', '2.4.4'
