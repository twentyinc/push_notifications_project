# Push notifications programming problem

## Goal
The goal is to be able to send push notification messages to users given a list of user ids and to provide admins an easy way to generate that list of ids.

## Timeframe
Please spend no more than 4 - 5 hours max on this project. There is no deadline.

## Implementation

### Backend

We want a method/function that looks something like:

`MessagingService.send_notifications([1, 2, 3], "This is a notification")`
where 1, 2, 3 are user ids. This method should return the number of devices to which notifications were sent.

To send notifications to users, you can use the `Messenger` class in the file `messenger.rb`. See the documentation within the class for parameters and return values. This is a mock version of Firebase's cloud messaging api which we've included so you don't have to deal with setting up Firebase.

You should also create a SQL database and the tables to support your PushNotifier class, including a users table (you can populate with fake users) and a device_tokens table.

A user can have many device tokens (since a user can have many devices).

To populate the device tokens table with tokens, you can generate fake tokens using the `Messenger.generate_token` method


### Frontend
For the frontend, create an Single Page App (in any framework you want) that allows me to select a list of users. 

To select the list of users, I should be able to search for a user by name and add them to the list. The users should be coming from your database so you'll probably need to create a small backend api for this.

Once I've selected my users, I should be able to get the user ids as a csv. (Yes, it is kind of silly that the frontend doesn't directly call the backend push notification service, but this helps appropriately scope the project so it doesn't become too long)

### Considerations

While the `Messenger` class is provided in Ruby, you're welcome to use whatever language you're most comfortable with. If you use another language, create your own implementation of `Messenger` with the same semantics as the Ruby implementation provided.

Errors and edge cases are important here! For example, would restarting the script if it failed part way through cause a user to receive 2 notifications?

Finally, feel free to add improvements as you see fit. eg. a cooldown period where a user can't receive more than N notifications in X time. These aren't necessary but if it makes sense to you then go for it. Pretend this is a lightweight production implementation.

You can use whatever open source libraries or packages that would be helpful.

## Contact
If you have any questions, feel free to email me at rohan (at) gethello.org
Thanks for taking the time to work on this, it's very appreciated.
