vagrant-symfony2-kickstart
==========================

Symfony 2 Vagrant development kickstart environment.

This is a **Vagrant** environment, provisioned by puppet (generated by [puphpet](https://puphpet.com/)) with a **clean folder structure for Symfony 2 development**.

**Composer** is installed on the machine, a base composer file is foreseen for a default symfony setup.

This repository has following folder structure:

* `bin` : folder with wrapper scripts for easier managemnt and usage of the VM.
* `puphpet` : provisioning for the vagrant box.
  This folder contains also the yaml file to configure the Vagrant box and its provisioning.
* `symfony` : folder structure & code for the symfony project.
* `.gitignore` : global GIT ignore file. Symfony has its own ignore file within the /symfony folder.
* `Vagrantfile` : vagrant config file.


Requirements
------------

You need Virtualbox 4.3 (or higher) and vagrant.

See the [Vagrant: Getting started documentation](http://docs.vagrantup.com/v2/getting-started/index.html).


Setup
-----

Download or clone the repository.

You can change the settings of the machine provisioning by editing the  `/puphpet/config.yaml` file:

* Change the guest machine IP address (vm:network:private_network: 192.168.56.154).
* Change the vhost name (apache:vhosts:servername: symfony2.dev)
* PHP version (php:install:version: '54', can be 53, 54 or 55).
* PHP timezone (php:timezone: Europe/Brussels)
* …

Add an entry to your hosts file.

```
192.168.56.154	symfony2.dev
```
_(or use the IP address that you entered in the config.yaml file)_


Run virtual machine
-------------------

Open a terminal and go to the root directory of your unpacked download or cloned repository.

Run the following command:

```
$ bin/run-machine.sh
```

This will:

* Startup the virtual machine (`$ vagrant up`)
* Run the bin/composer-update.sh script when the machine has started.

Point your browser to the development environment:
[http://symfony2.dev/app_dev.php](http://symfony2.dev/app_dev.php)


Command line tools
------------------

You can run commend line commands on the VM by opening a terminal session on that machine.

Run following command from within the root of the download or cloned repository:

```
$ vagrant ssh
```

### composer update

Composer is available as a system service within the VM.

You can run the composer tool by using the `$ vagrant ssh` command. 

There is a shortcut available in the /bin directory to run the `composer update`command within the root of the Symfony project. You can run this command from within the  root of the downloaded or cloned repository:

```
$ bin/composer-update.sh
```

This will run the `composer update` command within the VM:

```
$ vagrant ssh -c "composer update -d /var/www/symfony/"
```


VM content
----------

The VM is based on the [ubuntu-precise12042-x64-vbox43 box](http://box.puphpet.com/ubuntu-precise12042-x64-vbox43.box) hosted on the puphpet server.

The provioning installs to the box:

* [Mailcatcher](http://mailcatcher.me/): outgoing emails are captured by this tool. Emails can be read by opening the web mail reader 
[http://192.168.56.154:1080](http://192.168.56.154:1080).
* Apache 2.2.22
* PHP 5.4 (can be changed in the `/puphpet/config.yaml` file).
* Xdebug is installed and enabled.
* MySQL 5.5.35
* The `symfony` folder is mounted in the machine to the /var/www/symfony path.
* There is one vhost [http://symfony2.dev](http://symfony2.dev/) pointing to the `/var/www/symfony/www` folder.




