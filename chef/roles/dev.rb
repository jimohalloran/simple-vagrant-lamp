name "base"
description "Base OS Setup"
run_list 'recipe[timezone-ii]',
	'recipe[ntp]',
	'recipe[build-essential::default]',
	'recipe[yum-epel]',
	'recipe[app::packages]',
	'recipe[apache2]',
    'recipe[apache2::mod_php5]',
    'recipe[apache2::mod_ssl]',
    'recipe[app::php]',
    'recipe[app::xdebug]',
    'recipe[app::webapp]',
    'recipe[composer]',
    'recipe[phpunit]',
    'recipe[phing]',
    'recipe[mysql::server]',
    'recipe[mysql::client]',
	'recipe[app::database]'

default_attributes 	'app' => {
	    'ssl' => {
	        'enabled' => false
	    },
	    'url' => {
	        'host' => "local.app.dev"
	    },
	    'mysql' => {
	        'host' => 'localhost',
	        'database' => 'app',
	        'application' => {
	            'username' => 'app',
	            'password' => 'Password1',
	            'acl' => 'localhost'
	        },
	        'admin' => {
	            'username' => 'appadmin',
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
	"tz" => "Australia/Adelaide",
    'timezone' => {
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
        'server_root_password' => 'ih67NSLAs6qN',
        'server_debian_password' => 'eoje$5ZF1xC#',
        'allow_remote_root' => false,
        'remove_anonymous_users' => true,
        'root_network_acl' => nil
    }


