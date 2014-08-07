---
---

Installation
============

- [Laravel](#laravel)
- [Install via composer](#install-composer)
- [Install via download](#install-composer_download)
- [Install options](#options)
- [Installing on AWS](#aws)

## Working with Laravel

Learning Locker is built upon the excellent [Laravel](http://laravel.com). Laravel has great documentation, so, we are going to focus on the 
key areas for Learning Locker as well as a couple of gotcha's. You will see reference to the Laravel docs throughout as it doesn't make
sense to duplicate the efforts of a vibrant and growing community.

[Laravel Docs](http://laravel.com/docs)

## Via Composer Create-Project

    composer.phar create-project learninglocker/learninglocker

> If you get a message 'Do you want to remove the existing VCS (.git, .svn ...) history? [Y,n] - ***select Y***


#### Via download

If you would prefer, you can grab the latest tagged release and unpack it into your directory. 

[Releases page](https://github.com/LearningLocker/learninglocker/releases)

Then run

    composer.phar install

***

### Run the following artisan command 

    php artisan generate:migration add_statements

This will create a dated migration file in app/database/migrations – check that it contains the following method:

    public function up(){
      Schema::table('statements', function($table){
          $table->index('lrs._id');
          $table->index(array('lrs._id', 'statement.object.id'));
          $table->index(array('lrs._id', 'statement.verb.id'));
          $table->index(array('lrs._id', 'statement.actor.mbox'));
        });
      }

if it doesn’t, add it.

### MongoDB

Make sure you have MongoDB set up with your db credentials added to 

    app/config/database.php on line 86 under mongodb 

Now run

    php artisan migrate

Add the following service provider to app/config/app.php in 'Autoloaded Service Providers'

    'Jenssegers\Mongodb\Auth\ReminderServiceProvider'

### Email

Set up email notification in 

    app/config/mail.php 

**(if you do not want to set up email, change 'pretend' to true)**


### Register first user

Go to yoursite/register and create the first user (which will be super admin). 

When registration is complete, you will be logged in. Next, select 'settings' to visit overall settings and click on 'edit' - here you can give your install a name and description as well as set a few options for the install.

#### You are now ready to use Learning Locker

> **Previous releases**
> 
> If you would like to use a previous version of Learning locker just append the tagged name to the path. e.g learninglocker/learninglocker=v1.0rc1

## Install options

You can change various settings such as debug mode, default language and timezone in 
    
    app/config/app.php

## Installation on AWS

There are very detailed instructions for getting [Learning Locker running on AWS](http://cloudboffins.com/advanced-projects/learning-locker-lrs-free-server-part-1/) (it's a five part series)
