---
---

# Upgrading
If you've downloaded Learning Locker using Git you will need to upgrade like this.

1. If this is your first time upgrading, run `git checkout -b local`.
2. Run `git fetch --tags`.
3. Run `git merge TAG`. Where TAG is the release (i.e. "v1.3.4").
4. Run `composer install`.
5. Run `php artisan migrate`.
6. Check the [release notes](https://github.com/LearningLocker/learninglocker/releases) for any further steps.

For more information about using Git please see the [Git documentation](http://git-scm.com/).
