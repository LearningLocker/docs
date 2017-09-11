---
---

# Structuring your LRS Guide
In Learning Locker you can structure your organisations, stores, clients, and users to manage the visibility of data in your Learning Locker instance. There are few key concepts that you should know before we get started.

- Organisations contain stores and clients.
- Stores contain xAPI statements and xAPI documents.
- Clients can be used to access data within the organisation via HTTP interfaces.
- Clients can be restricted to only access data within single store within their organisation.
- Users can be used to access the Browser Interface.
- Users can be added to many organisations.

Imagine you have a Learning Locker instance with one organisation (Organisation A) and inside that organisation you have one store (Store A) and one client (Client A) that only has access to Store A. Inside your Learning Locker instance you also have two users (User A and User B) and they've both been added to Organisation A.

Now imagine that you want to store some data that User A is allowed to see, but User B shouldn't be allowed to see. In this scenario, you should create a new organisation (Organisation B) and add only User A to it, leaving User B out so they can't see the data in that organisation.

Now imagine that you want to store some xAPI statements that User A and User B are allowed to see, but you don't want to allow applications using Client A to access the xAPI statements. In this scenario, you should create a new store (Store B) and create a new client (Client B) that can access Store B. Note that Client B will be automatically created when you create Store B, because Learning Locker automatically creates a client when you create a store.
