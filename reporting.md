---
---

# Reporting
Learning Locker provides a generic tool for filtering statements that we call "reporting". This guide will document everything you can do with the reporting tool. You can use the reporting tool by selecting an LRS from the "LRS List" (in the top right), then clicking "Reporting" on the menu (on the left).

- [Create a report](#create-a-report)
- [Remove a report](#remove-a-report)
- [Edit a report](#edit-a-report)
  - [Filter by actor (who)](#filter-by-actor)
  - [Filter by verb (did)](#filter-by-verb)
  - [Filter by activity (what)](#filter-by-activity)
  - [Filter by content (where)](#filter-by-context)
  - [Filter by result (with result)](#filter-by-result)
  - [Filter by date (when)](#filter-by-date)
- [View statements in a graph](#view-statements-in-a-graph)
- [View statements in a list](#view-statements-in-a-list)

## Create a report
Click the (green) "Add" button. A new entry will appear in the list of reports, you can then [edit](#edit-a-report) that report.

## Remove a report
Click the (red) "Delete" button next to the report. Then select "OK" in the message that pops up.

## Edit a report
Click the (blue) "Edit" button next to the report. From there you will be taken to a page where you can add filters to your report.

### Filter by actor
Click the (grey) square that says "Who". You can then add and remove actors from the list that appears below.

#### Adding an actor
Click the (green) "Add" button (below the list of actors - which may be empty at this point). This will add a new entry to the list of actors, you can then type the name (`statement.actor.name`) of the actor you're searchng for in the text box. *Currently* the report will filter by the email (`statement.actor.mbox`) associated with the actor you've selected.

#### Removing an actor
Click the (red) minus icon next to the actor. Then select "OK" in the message that pops up.

### Filter by verb
Click the (grey) square that says "Did". You can then add and remove verbs from the list that appears below.

#### Adding a verb
Click the (green) "Add" button (below the list of verbs - which may be empty at this point). This will add a new entry to the list of verbs, you can then type the name (`verb.id`) of the verb you're searchng for in the text box.

#### Removing a verb
Click the (red) minus icon next to the verb. Then select "OK" in the message that pops up.

### Filter by activity
Click the (grey) square that says "What". You can then add and remove "activities" and "activity types" from the lists that appears below.

#### Adding an activity or activity type
Click the (green) "Add" button (below the list you'd like to add to - which may be empty at this point). This will add a new entry to the list, you can then type the name of the "activity" (`statement.object.id`) or "activity type" (`statement.object.definition.type`) you're searchng for in the text box.

#### Removing an activity or activity type
Click the (red) minus icon next to the item. Then select "OK" in the message that pops up.

### Filter by content
Click the (grey) square that says "Where". You can then add and remove "parent activities", "grouping activities", "platforms", "instructors", or "languages" from the lists that appears below.

#### Adding an activity or activity type
Click the (green) "Add" button (below the list you'd like to add to - which may be empty at this point). This will add a new entry to the list, you can then type the name of the "parent activity" (`statement.context.contextActivities.parent.id`), "grouping activiy" (`statement.context.contextActivities.grouping.id`), "platform" (`statement.context.platform`), "instructor" (`statement.context.instructor`), or "language" (`statement.context.language`) you're searchng for in the text box.

#### Removing an activity or activity type
Click the (red) minus icon next to the item. Then select "OK" in the message that pops up.

### Filter by result
Click the (grey) square that says "With result". You can then filter by score, success, or completion.

#### Filter by score
You can set a min (left-most box) and/or a max (right-most box) for each of the scales. You can filter by maximum (max - `statement.result.score.max`), minimum (min - `statement.result.score.min`), the actual mark (raw - `statement.result.score.raw`), and the percentage of the raw mark in relation to the max mark (scaled - `statement.result.score.scaled`). Change the min and max by entering a number into the boxes, you can remove these filters by clicking the (red) "Clear" button next to the score.

#### Filter by success
Success (`statement.result.success`) may determine whether a learner was successful in passing a test. Setting this filter to `true` will return all the statements that show a successful pass and `false` will do the opposite. You can remove this filter by clicking the (red) "Clear" button next to success.

#### Filter by completion
Complete (`statement.result.completion`) may determine whether a learner completed a test. Setting this filter to `true` will return all the statements that show a completed test and `false` will do the opposite. You can remove this filter by clicking the (red) "Clear" button next to success.

### Filter by date
Click the (grey) square that says "When". You can then select a since and/or until date which will determine the date (`statement.timestamp`) range you're interested in. Statements that were not made during your date range will not be returned (unless it meets [certain conditions regarding statement refs](https://github.com/adlnet/xAPI-Spec/blob/master/xAPI.md#filter-conditions-for-statementrefs)).

## View statements in a graph
Click the (green) "Graph" button next to the report. From there you will be taken to a page where you can view the statements returned from your report in a graph.

## View statements in a list
Click the (green) "Statements" button next to the report. From there you will be taken to a page where you can view the statements returned from your report in a list.
