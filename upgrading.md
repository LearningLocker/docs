/*
Title: Upgrading
Order: 9
*/

Upgrading
=========

## Upgrading to v1.0

#### Migrating statements from a pre v1.0rc1
If you are running a developer version of Learning Locker (pre 1.0rc1) then you will need to migrate all your statements in order to use this version:

1. Open up a terminal and get your mongo shell running
2. Rename the statements table to old_statements

        db.statements.renameCollection(‘old_statements’)

3. Visit /migrate and follow the instructions. (make sure you are logged in)