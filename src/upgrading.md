---
---

# Upgrading

## Upgrading via Github with Git
If you've downloaded Learning Locker using Git you will need to upgrade like this.

1. If this is your first time upgrading, run `git checkout -b local && git add -A && git commit -am 'Local changes.'`.
2. Run `git fetch --tags`.
3. Run `git merge TAG`. Where TAG is the release (i.e. "v1.3.4").
4. Run `composer install`.
5. Run `php artisan migrate --env=YOUR_ENV` where `YOUR_ENV` should be replaced with your environment (likely to be local or production).
6. Check the [release notes](https://github.com/LearningLocker/learninglocker/releases) for any further steps.

For more information about using Git please see the [Git documentation](http://git-scm.com/).

## Upgrading via Packagist with Composer
If you've downloaded Learning Locker using Composer you will need to upgrade like this. However, we recommend that you [download Learning Locker via Github with Git](../installation/#download-and-install) and [upgrade via Github with Git](#upgrading-via-github-with-git) for a better upgrade experience.

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
