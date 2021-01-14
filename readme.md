# Push notifications programming problem

## Goal
The goal is to create a small app to send push notification messages to users given a list of user ids.

## Timeframe
Please spend no more than 3 - 4 hours max on this project. There is no deadline.

## Implementation

### Backend

Ultimately we want a method/function that looks something like:

`MessagingService.send_notifications([1, 2, 3], "This is a notification")`
where 1, 2, 3 are user ids. This method should return the number of devices that actually received notifications. We also want this functionality to be accessible via a website.

You should also create the tables to support your PushNotifier class, including a users table (you can populate with fake users) and a device_tokens table. You should use a SQL database

A user can have many device tokens (since a user can have many devices).

To populate the device tokens table with tokens, you can generate fake tokens using the `Messenger.generate_token` method

To send notifications to users, you can use the `Messenger` class. See the documentation within the class for parameters and return values. This is a mock version of Firebase's cloud messaging api to avoid dealing with setting up Firebase.

### Frontend
For the frontend, create an SPA (in any framework you want) that allows me to select a list of users and the notification text. 

To select the list of users, I should be able to search for a user by name and add them to the list. The users should be coming from your database so you'll probably need to create a small webservice for this as well.

Once I've selected my users and notification body, hitting "Send" should download the user id list as a CSV. Yes this is kind of silly but helps appropriately scope the project and means you don't have to deal with long running requests

### Considerations

While the `Messenger` class is provided in Ruby, you're welcome to use whatever language you're most comfortable with. If you use another language, create your own implementation of `Messenger` with the same semantics as the Ruby implementation provided.

Errors and edge cases are important here! For example, consider what would happen in your implementation if batch A succeeded and batch B failed. Would restarting the script cause batch A to receive 2 notifications? Not a great UX.

Finally, feel free to add UX improvements as you see fit. eg. a cooldown period where a user can't receive more than N notifications in X time. These aren't necessary but if it makes sense to you then go for it. Pretend this is a lightweight production implementation.

## Contact
If you have any questions, feel free to email me at rohan@gethello.org
Thanks for taking the time to work on this, it's very appreciated.