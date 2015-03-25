---
---

# Installation

Installation steps:

1. [Install the requirements](#requirements)
2. [Download and Install LL](#download-and-install)
3. [Setup Mongo](#setup-mongodb)
4. [Register your first user](#register-your-first-user)

Additional information:

- [Configuration](#configuration)
- [Quirks](#quirks)
- [Installation on AWS](http://cloudboffins.com/advanced-projects/learning-locker-lrs-free-server-part-1/) thanks to [Cloud Boffins](http://cloudboffins.com)
- [Installation on Ubuntu](http://www.jpablo128.com/how_to_install_learning_locker/) thanks to [@jpablo128](https://twitter.com/jpablo128)
- [Installation on CentOS 7.0](https://gist.github.com/davidpesce/7d6e1b81594ecbc72311) thanks to [@davidpesce](https://github.com/davidpesce)
- [Installation on Ubuntu with Vagrant](http://www.jmblog.org/blog/2015/02/03/learning-locker-vagrant) thanks to [Jim Baker](http://www.jmblog.org)

## Requirements
Learning Locker requires the components listed below. Learning Locker is built upon the excellent [Laravel](http://laravel.com) PHP framework, so in addition to the components below, please see the [Laravel requirements](http://laravel.com/docs/4.2#server-requirements).

* [PHP v5.5](http://php.net) - may also work on newer versions.
* [Composer](http://getcomposer.org)
* [MongoDB v2.6.x](http://mongodb.org) - may also work on newer versions.
* [MongoDB php extension](http://www.php.net/manual/en/mongo.installation.php)
* [Node and NPM](http://nodejs.org)
* [Bower](http://bower.io)

## Download and Install
To download and install Learning Locker, you need to run the commands below.

    git clone git@github.com:LearningLocker/learninglocker.git learninglocker
    cd learninglocker
    composer install

## Setup MongoDB
Make sure you have MongoDB set up with your db credentials added to `app/config/local/database.php` (or `app/config/database.php` depending on your `bootstrap/start.php` file) inside `connections` under `mongodb`. Then run the command below.

    php artisan migrate

If you're upgrading please check the [release notes](https://github.com/LearningLocker/learninglocker/releases) for any further steps.

## Register your first user
Go to `yoursite/register` and create the first user.

- Your first user will become your instance's super user. See [adminstration](../administration) for more information.
- If you've not setup emails, manually verify your email.
  1. Click on "users" (left hand sidebar)
  2. Click the grey verified button next to your user (it will turn green with a tick)

## Configuration
By default the `app/config/local` configuration will be used if you access Learning Locker via your localhost. You can change various settings such as debug mode, default language and timezone in `app/config/app.php`.

## Quirks
1. Depending on your set up, you may need to append "public" to your site URL e.g. "yoursite.com/public/".
2. MongoDB doesn’t allow full stops (".") in keys. Therefore, we replace all full stops in keys with "&46;" on incoming objects (such as statements) and the opposite on outgoing objects.
3. To host Learning Locker on a HTTPS site, please see the ["Hosting Learning Locker on https:// site" thread](https://groups.google.com/forum/#!topic/learning-locker/3Y0VGYPV1d8).
