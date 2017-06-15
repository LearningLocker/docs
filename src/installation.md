---
---

# Installation

#### Installation steps

1. [Install the requirements](#requirements)
2. [Download and Install LL](#download-and-install)
3. [Setup Mongo](#setup-mongodb)
4. [Configure LL](#configuration)
5. [Register your first user](#register-your-first-user)

#### Specific installation guides

- [Docker](https://hub.docker.com/r/sproutlabs/learninglocker/) thanks to [Sprout Labs](http://sproutlabs.com.au/) (via Docker Hub) - 2017-06-14
- [CentOS 7.3 via Vagrant with Ansible](https://github.com/davidpesce/learninglocker-v1-dev-env) thanks to [David Pesce](https://github.com/davidpesce) (via Github) - 2017-03-15
- [CentOS 7.0](https://gist.github.com/davidpesce/7d6e1b81594ecbc72311) thanks to [David Pesce](https://github.com/davidpesce) (via Gist) - 2017-02-17
- [CentOS 7.0 with Docker](https://github.com/LearningLocker/docs/issues/15) thanks to [Andrew Blum](https://github.com/ajblum) (via Github) - 2015-05-15
- [Ubuntu 14 with AWS](https://www.youtube.com/watch?v=51Dci7B49xA) thanks to [Kristin Anthony](https://www.youtube.com/channel/UCMum_tZBqqp2DM110UqyFyw) (via Youtube) - 2016-10-09
- [Ubuntu with Vagrant](http://www.jmblog.org/blog/2015/02/03/learning-locker-vagrant) thanks to [Jim Baker](http://www.jmblog.org) (via blog post) - 2015-02-03
- [Ubuntu](http://www.jpablo128.com/how_to_install_learning_locker/) thanks to [J. Pablo Caballero](https://twitter.com/jpablo128) (via blog post in English and Español) - 2014-12-29

*Please refer to the [requirements](#requirements) whilst using these guides, as their links to the requirements may be old.*

#### Additional information

- [Quirks](#quirks)
- [Load Balancing](http://learninglocker.net/blog/load-balancing-learning-locker/) - scaling Learning Locker.
- [Improving Speed](https://learninglocker.net/blog/learning-locker-v1-12/) - reducing Mongo timeouts in Learning Locker.

## Requirements
Learning Locker requires the components listed below. Learning Locker is built upon the excellent [Laravel](http://laravel.com) PHP framework, so in addition to the components below, please see the [Laravel requirements](http://laravel.com/docs/4.2#server-requirements).

* [PHP v5.5](http://php.net) - may also work on newer versions.
* [MongoDB v2.6.x](http://mongodb.org) - we recommend v3.x - may also work on newer versions.
* [MongoDB PHP extension (latest version)](https://github.com/mongodb/mongo-php-driver-legacy/releases).

## Download and Install
To download and install Learning Locker, you need to run the commands below.

    git clone -b master git@github.com:LearningLocker/learninglocker.git learninglocker
    cd learninglocker
    php -r "readfile('https://getcomposer.org/installer');" | php
    php composer.phar install --no-interaction --no-dev

## Setup MongoDB
Make sure you have MongoDB set up with your Mongo credentials added to `app/config/local/database.php` (you will need to create this file, see the example below - it will override default settings in `app/config/database.php`).

    <?php
    return [
        'connections' => [
            'mongodb' => [
                'driver'   => 'mongodb',
                'host'     => 'localhost',
                'port'     => 27017,
                'username' => 'YOUR_DATABASE_USERNAME',
                'password' => 'YOUR_DATABASE_PASSWORD',
                'database' => 'YOUR_DATABASE_NAME'
            ],
        ]
    ];

Then run the command below.

    php artisan migrate


## Configuration
The "app/config" directory contains the base configuration. By default the "app/config/local" directory will be used and overrides the base configuration. You should change the [encryption key](https://github.com/LearningLocker/learninglocker/issues/488) in "app/config/local/app.php" (see the example below).

    <?php
    return [
        'key' => 'YOUR_SECRET_KEY'
    ];

If you would like invited users to recieve an email containing their invitation link, you will need to change your "app/config/local/mail.php" file (see the example below).

    <?php
    return [
        'pretend' => false,
        'username' => 'YOUR_USERNAME',
        'password' => 'YOUR_PASSWORD',
        'host' => 'YOUR_SMTP_HOST',
        'port' => 'YOUR_SMTP_PORT',
        'from' => [
            'address' => 'YOUR_EMAIL_ADDRESS',
            'name' => 'YOUR_NAME'
        ]
    ];


Learning Locker will need to be able read and write files so you need to change permissions for the `FS_LOCAL_ENDPOINT` which can be set in ".env.local.php" to override the defaults in ".env.php". Assuming that the current user is the owner of the files please do something similar to this:

    sudo gpasswd -a www-data `id -g -n $USER`
    sudo find app/storage/ -type d -exec chmod 775 {} + && sudo find app/storage/ -type f -exec chmod 664 {} +
    sudo find uploads/ -type d -exec chmod 775 {} + && sudo find uploads/ -type f -exec chmod 664 {} +
    
Other [file storage configuration options](https://github.com/LearningLocker/learninglocker/blob/master/app/locker/repository/File/readme.md) are available as of [v1.9.0](https://github.com/LearningLocker/learninglocker/releases/tag/v1.9.0).

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
4. If you get a 404 error for the "/login" or "/register" page. Please see the ["Installation Problem" thread](https://groups.google.com/forum/#!topic/learning-locker/ULtoICNOKa0), you may also need to check the ["Register your first user returns not found" issue](https://github.com/LearningLocker/learninglocker/issues/477).
5. If Learning Locker can't connect to MongoDB, please check out the ["Windows install Failed to connect" thread](https://groups.google.com/forum/#!topic/learning-locker/B_UX6opI9tg).
6. If you'd like to turn debugging information off, please check out the ["Clockwork directory takes a few GB of space" issue](https://github.com/LearningLocker/learninglocker/issues/808).
