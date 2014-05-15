Learning Locker requires PHP 5.4+ with the MongoDB extension, MongoDB, Composer and Apache.

#### Components

* Composer (http://getcomposer.org/)
* MongoDB (http://mongodb.org)
* MongoDB php extension (http://www.php.net/manual/en/mongo.installation.php)


***

#####We are currently testing v1.0rc1 - this will become the first stable release once testing is complete.

Using composer run 
```
composer.phar create-project learninglocker/learninglocker=dev-master
```
*Note:* There's no need to download the code from Github beforehand; Composer will do this.

*Note:* If you get a message _'Do you want to remove the existing VCS (.git, .svn ...) history? [Y,n]_ - select Y

Then, in your terminal, run the following artisan command 
```
php artisan generate:migration add_statements
```

This will create a dated migration file in app/database/migrations – check that it contains the following method:
```
public function up(){
  Schema::table('statements', function($table){
    $table->index('lrs._id');
    $table->index(array('lrs._id', 'statement.object.id'));
    $table->index(array('lrs._id', 'statement.verb.id'));
    $table->index(array('lrs._id', 'statement.actor.mbox'));
  });
}
```
if it doesn’t, add it.

***

* Make sure you have MongoDB set up with your db credentials added to app/config/database.php on line 86 under mongodb. 
* Now, run:
```
php artisan migrate
```
* Add the following service provider to app/config/app.php in 'Autoloaded Service Providers'
```
'Jenssegers\Mongodb\Auth\ReminderServiceProvider'
```
* Set up email notification in app/config/mail.php (if you do not want to set up email, change 'pretend' to true in app/config/mail.php)
* Set your domain url in app/config/app.php
* Go to yoursite/register and create the first user (which will be super admin). _E.g. if you installed the site in a folder called learninglocker on your localhost, your site might be at ```http://localhost/learninglocker/public/```_
* When registration is complete, you will be logged in. Next, select 'settings' to visit Overall settings and click on 'edit' - here you can give you install a name and description as well as set a few options for the install.

You are now ready to start using Learning Locker.

#### Install options

You can change various settings such as debug mode, default language and timezone in app/config/app.php

#### Installation on AWS

There are very detailed instructions for getting Learning Locker running on AWS at http://cloudboffins.com/advanced-projects/learning-locker-lrs-free-server-part-1/ (it's a five part series)