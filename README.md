# Rails Chat API 

Rails Chat API that allows messages to be sent between two users and renders json of their conversation. (No Authentication)

When one user sends a message to another, a conversation is created between the two (or found if the conversation already exists) and a message is added to the list of messages belonging to the conversation.

### Rails Version

Using 

```
rails (5.1.4)
```

### Installing

```
bundle install

rails db:create db:migrate db:seed
```


