name "base"
description "Base OS Setup"
run_list 'recipe[timezone_iii]',
	'recipe[ntp]',
	'recipe[build-essential::default]',
	'recipe[yum-epel]',
	'recipe[yum-ius]',
	'recipe[app::packages]',
	'recipe[apache2]',
    'recipe[apache2::mod_ssl]',
    'recipe[app::php]',
    'recipe[app::xdebug]',
    'recipe[app::webapp]',
    'recipe[composer]',
    'recipe[phpunit]',
    'recipe[phing]',
	'recipe[app::node]',
	'recipe[app::database]'

default_attributes 	'app' => {
	    'ssl' => {
	        'enabled' => false
	    },
	    'url' => {
	        'host' => "local.app.dev"
	    },
	    'mysql' => {
	        'app' => {
	            'host' => '127.0.0.1',
	            'database' => 'app',
	            'username' => 'app',
	            'password' => 'Password1',
	            'acl' => '%'
	        }
	    }
	},
	'phpunit' => {
	    'install_method' => 'phar'
	},
	'composer' => {
	    'install_dir' => '/usr/local/bin'
	},
    'timezone_iii' => {
    	"timezone" => "Australia/Adelaide",
        'use_symlink' => true
    },
    'ntp' => {
            'servers' => [
                '0.au.pool.ntp.org',
                '1.au.pool.ntp.org',
                '2.au.pool.ntp.org',
                '3.au.pool.ntp.org'
            ]
    },
    'mysql' => {
        'server_version' => '5.7',
        'server_root_password' => 'ih67NSLAs6qN',
        'server_debian_password' => 'eoje$5ZF1xC#',
        'allow_remote_root' => false,
        'remove_anonymous_users' => true,
        'root_network_acl' => nil
    }

override_attributes 'php' => {
        'packages' => %w(mod_php71u php71u php71u-devel php71u-cli php71u-json php71u-mbstring php71u-pdo php71u-mysqlnd php71u-pecl-xdebug)
    }

