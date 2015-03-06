---
---

# Upgrading

- [Upgrading via Github with Git](#upgrading-via-github-with-git)
- [Upgrading via Packagist with Composer](#upgrading-via-packagist-with-composer)
- [Upgrading to v1.0](#upgrading-to-v10)

## Upgrading via Github with Git
If you've downloaded Learning Locker using Git you will need to upgrade like this.

1. If this is your first time upgrading, run `git checkout -b local`.
2. Run `git fetch --tags`.
3. Run `git merge TAG`. Where TAG is the release (i.e. "v1.3.4").
4. Run `composer install`.
5. Run `php artisan migrate`.

For more information about using Git please see the [Git documentation](http://git-scm.com/).

## Upgrading via Packagist with Composer
If you've downloaded Learning Locker using Composer you will need to upgrade like this. However, we recommend that you [download Learning Locker via Github with Git](../installation/#github-with-git) and [upgrade via Github with Git](#upgrading-via-github-with-git) for a better upgrade experience.

1. Copy your "bootstrap/start.php" file.
2. Copy your "app/config/local" directory.
3. Remove your Learning Locker directory.
4. Replace "bootstrap/start.php" with your previously copied version.
5. Replace your "app/config/local" directory with your previously copied version.
6. Run `composer install`.
7. Run `php artisan migrate`.

## Upgrading to v1.0
If you are running a developer version of Learning Locker (pre 1.0rc1) then you will need to migrate all your statements in order to use this version:

1. Open up a terminal and get your mongo shell running
2. Rename the statements table to old_statements

        db.statements.renameCollection(‘old_statements’)

3. Visit /migrate and follow the instructions. (make sure you are logged in)
