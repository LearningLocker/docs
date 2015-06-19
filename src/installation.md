---
---

# Installation

Installation steps:

1. [Install the requirements](#requirements)
2. [Download and Install LL](#download-and-install)
3. [Setup Mongo](#setup-mongodb)
4. [Configure LL](#configuration)
5. [Register your first user](#register-your-first-user)

Additional information:

- [Quirks](#quirks)
- [Installation on AWS](http://cloudboffins.com/advanced-projects/learning-locker-lrs-free-server-part-1/) thanks to [Cloud Boffins](http://cloudboffins.com)
- [Installation on Ubuntu](http://www.jpablo128.com/how_to_install_learning_locker/) thanks to [@jpablo128](https://twitter.com/jpablo128)
- [Installation on Ubuntu with Vagrant](http://www.jmblog.org/blog/2015/02/03/learning-locker-vagrant) thanks to [Jim Baker](http://www.jmblog.org)
- [Installation on CentOS 7.0](https://gist.github.com/davidpesce/7d6e1b81594ecbc72311) thanks to [@davidpesce](https://github.com/davidpesce)
- [Installation on CentOS 7.0 with Ansible (and optionally Vagrant)](https://github.com/gomezgoiri/learninglocker-centos7) thanks to [@gomezgoiri](https://github.com/gomezgoiri)
- [Installation on CentOS 7.0 with Docker](https://github.com/LearningLocker/docs/issues/15) thanks to [@ajblum](https://github.com/ajblum)
- [Load Balancing](http://learninglocker.net/2015/04/01/load-balancing-learning-locker/)

## Requirements
Learning Locker requires the components listed below. Learning Locker is built upon the excellent [Laravel](http://laravel.com) PHP framework, so in addition to the components below, please see the [Laravel requirements](http://laravel.com/docs/4.2#server-requirements).

* [PHP v5.5](http://php.net) - may also work on newer versions.
* [MongoDB v2.6.x](http://mongodb.org) - may also work on newer versions.
* [MongoDB php extension](http://www.php.net/manual/en/mongo.installation.php)

## Download and Install
To download and install Learning Locker, you need to run the commands below.

    git clone git@github.com:LearningLocker/learninglocker.git learninglocker
    cd learninglocker
    php -r "readfile('https://getcomposer.org/installer');" | php
    php composer.phar install --no-interaction --no-dev

## Setup MongoDB
Make sure you have MongoDB set up with your db credentials added to `app/config/local/database.php` (or `app/config/database.php` depending on your `bootstrap/start.php` file) inside `connections` under `mongodb`. Then run the command below.

    php artisan migrate

If you're upgrading please check the [release notes](https://github.com/LearningLocker/learninglocker/releases) for any further steps.

## Configuration
The "app/config" directory contains the base configuration. By default the "app/config/local" directory will be used and overrides the base configuration. You should change the [encryption key](https://github.com/LearningLocker/learninglocker/issues/488) in "app.php".

Learning Locker will need to be able read and write files so you need to change permissions for the `LOCAL_FILESTORE` and `SESSION_FILESTORE` which are set in "env.local.php". Assuming that the current user is the owner of the files please do something similar to this:

    sudo gpasswd -a www-data `id -g -n $USER`
    sudo find app/storage/ -type d -exec chmod 775 {} + && sudo find app/storage/ -type f -exec chmod 664 {} +
    sudo find uploads/ -type d -exec chmod 775 {} + && sudo find uploads/ -type f -exec chmod 664 {} +

## Register your first user
Go to `yoursite/register` and create the first user.

- Your first user will become your instance's super user. See [adminstration](../administration) for more information.
- If you've not setup emails, manually verify your email.
  1. Click on "users" (left hand sidebar)
  2. Click the grey verified button next to your user (it will turn green with a tick)

## Quirks
1. Depending on your set up, you may need to append "public" to your site URL e.g. "yoursite.com/public/".
2. MongoDB doesn’t allow full stops (".") in keys. Therefore, we replace all full stops in keys with "&46;" on incoming objects (such as statements) and the opposite on outgoing objects.
3. To host Learning Locker on a HTTPS site, please see the ["Hosting Learning Locker on https:// site" thread](https://groups.google.com/forum/#!topic/learning-locker/3Y0VGYPV1d8).
4. If you get a 404 error for the "/login" or "/register" page. Please see the ["Installation Problem" thread](https://groups.google.com/forum/#!topic/learning-locker/ULtoICNOKa0), you may also need to check [issue 477](https://github.com/LearningLocker/learninglocker/issues/477).
5. If Learning Locker can't connect to MongoDB, please check out the ["Windows install Failed to connect" thread](https://groups.google.com/forum/#!topic/learning-locker/B_UX6opI9tg).
