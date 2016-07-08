---
---

# Upgrading

## Upgrading via Github with Git
If you've downloaded Learning Locker using Git you will need to upgrade like this.

1. Run `git fetch --tags; git checkout -b local; git add app/config/local; git commit -m 'Adds local config.'; git add -A; git commit -m 'Local changes.'`.
1. Run `git merge TAG`. Where TAG is the release (i.e. “v1.3.4”).
1. Run `git rm --cached app/config/local -r; git add app/config/local; git commit -m 'Fixes local config.'; php -r "readfile('https://getcomposer.org/installer');" | php; php composer.phar install`.
1. Run `php artisan migrate --env=YOUR_ENV`. Where `YOUR_ENV` should be replaced with your environment (likely to be local or production).
1. Check the [release notes](https://github.com/LearningLocker/learninglocker/releases) for any further steps.

For more information about using Git please see the [Git documentation](http://git-scm.com/).

## Upgrading via Packagist with Composer
If you've downloaded Learning Locker using Composer you will need to upgrade like this. However, we recommend that you [switch from a Packagist installation to a Github installation](#switching-from-packagist-to-github) and [upgrade via Github with Git](#upgrading-via-github-with-git) for a better upgrade experience.

1. Copy your "bootstrap/start.php" file.
2. Copy your "app/config/local" directory.
3. Remove your Learning Locker directory.
4. Run `composer create-project learninglocker/learninglocker learninglocker`.
5. Run `cd learninglocker`.
6. Replace "bootstrap/start.php" with your previously copied version.
7. Replace your "app/config/local" directory with your previously copied version.
8. Run `composer install`.
9. Run `php artisan migrate --env=YOUR_ENV` where `YOUR_ENV` should be replaced with your environment (likely to be local or production).
10. Check the [release notes](https://github.com/LearningLocker/learninglocker/releases) for any further steps.

## Switching from Packagist to Github
1. Copy your “bootstrap/start.php” file.
2. Copy your “app/config/local” directory.
3. Remove your Learning Locker directory.
4. Run `git clone -b master git@github.com:LearningLocker/learninglocker.git learninglocker; cd learninglocker;`
5. Replace “bootstrap/start.php” with your previously copied version.
6. Replace your “app/config/local” directory with your previously copied version.
7. Then follow the [Upgrading via Github with Git instructions](http://docs.learninglocker.net/upgrading/#upgrading-via-github-with-git).
