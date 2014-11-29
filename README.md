About This Environment
----------------------

This repo is a starting point for a simple Vagrant based LAMP stack.  I built my own because I wanted a minimal, 
stripped back LAMP stack for development that was based on RHEL/CentOS and did not contain tools that I don't use 
(e.g. phpMyAdmin).  I also wanted something that could easilly dropped into an existing project for a quick start, 
and finally, I wanted a CentOS build, and most of the other Vagrant configs start on Ubuntu.  Not finding anything 
that was just right out there already, I took an afternoon abd built my own.

This configuration makes use of "pre-canned" Chef recipes wherever possible, and creates a 
CentOS 7, PHP 5.4, MySQL 5.5 environment, configured with an Apache vhost.  Useful tools such as xdebug, phpUnit, 
Composer, and Phing are preinstalled.  Basically just restore a database to it and you're good to go!  There is 
external access to MySQL from the host via an "appadmin" user.  Useful config values to tweak can be found in the 
chef/roles/dev.rb file  This could be used as a starting point for production environment, but you'd want to remove 
xdebug, harden the build, and use stronger passwords as a minimum.

Why Vagrant?
------------

Vagrant is a tool for managing virtual machine configurations.  It allows you to develop using text editors and tools
you're comfortable with on your machine's native Operating System, while the code runs on a web server inside a virtual
machine.  The virtual machine is configured ("provisioned" in Vagrant terminology) using Chef scripts so it is not
necessary for developers to configure their own virtual machines.  Chef ensures that each developer's environment is
configured consistently.  The same Chef scripts may be used to build production instances, so development environments
are configured identically to production.  Finally, Vagrant allows you to develop on a non-Linux host platform (Windows
or Max OS), and because execution happens in a VM, differences between your development host platform (e.g. case insensitive file systems)
and production aren't an issue.

Getting Started
---------------

To set up a development environment using Vagrant, first install the following software:

* Vagrant 1.6.x from http://www.vagrantup.com/downloads.html
* VirtualBox 2.3.x from https://www.virtualbox.org/wiki/Downloads

Install the vagrant-berkshelf and vagrant-omnibus plugins:

```vagrant plugin install vagrant-omnibus
vagrant plugin install vagrant-berkshelf```

Then from a command prompt in the same folder as this readme run the following command:

```vagrant up```

The first time this runs, a Vagrant "box" is downloaded which is approximately 500Mb.  This box is downloaded once and
stored on your local machine.  Subsequent ```vagrant up``` commands will not download the box again.  The box file is
a "vanilla" CentOS 7 install with no services configured.  The box file is then imported into VirtualBox automatically
and Chef is run to configure the box as per the recipes in this repository.

Once ```vagrant up``` is finished, the VM is ready to use.  You can access the VM with:

``` vagrant ssh```

No password is required.  If you need root access on the VM, passwordless sudo is available:

```sudo su -```

Once you've finished developing, you can stop the Vagrant VM with:

```vagrant halt```

If you want to delete the VM (the code, etc is still on your local machine, so nothing is lost you'll just need to
```vagrant up``` and restore a database to get up and running again):

``` vagrant destroy```

You'll need to restore a database into the MySQL server in the VM to finish off the configuration.  

You'll also need to create the following hosts file entry on your hsot machine:

```192.168.33.11   local.app.dev```

If your IDE is set to listen for debug connections in
port 9000 you should find debugging "just works (tm)", as Xdebug is already installed and configured in the VM.  Path
mappings might be required for PHPStorm.

To access MySQL on the VM from your desktop machine, use the following settings:

```Host:     192.168.33.11
Port:     3306
User:     appadmin
Password: Password1```
