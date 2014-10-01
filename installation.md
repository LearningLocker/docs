---
---

# Installation
Learning Locker is built upon the excellent [Laravel](http://laravel.com). Laravel has great documentation, so, we are going to focus on the key areas for Learning Locker as well as a couple of gotcha's. You will see reference to the Laravel docs throughout as it doesn't make sense to duplicate the efforts of a vibrant and growing community.

To install Learning Locker you need to follow these steps:

1. Get the source code either via:
    1. [Packagist with Composer](#packagist-with-composer)
    2. [Github with Git](#github-with-git)
2. [Setup Mongo](#setup-mongodb)
3. [Register your first user](Register-your-first-user)


Additional information:

- [Configuration](#configuration)
- [Installation on AWS](#Installation-on-AWS)


## Get the source
### Packagist with Composer

    composer create-project learninglocker/learninglocker

**If you get a message 'Do you want to remove the existing VCS (.git, .svn ...) history? [Y,n]', select 'Y'**


### Github with Git
If you would prefer, you can grab the [latest tagged release](https://github.com/LearningLocker/learninglocker/releases) and unpack it into your directory. Then run `composer install`.

## Setup MongoDB
Make sure you have MongoDB set up with your db credentials added to `app/config/database.php` on line 86 under `mongodb`. Then run `php artisan migrate`.

## Register your first user
Go to `yoursite/register` and create the first user (which will be super admin). When registration is complete, you will be logged in. Next, select 'settings' to visit overall settings and click on 'edit' - here you can give your install a name and description as well as set a few options for the install.

You are now ready to use Learning Locker If you would like to use a previous version of Learning locker just append the tagged name to the path. e.g learninglocker/learninglocker=v1.0rc1

## Configuration
By default the `app/config/local` configuration will be used if you access Learning Locker via your localhost. You can change various settings such as debug mode, default language and timezone in `app/config/app.php`.

## Installation on AWS
There are very detailed instructions for getting [Learning Locker running on AWS](http://cloudboffins.com/advanced-projects/learning-locker-lrs-free-server-part-1/) (it's a five part series)
