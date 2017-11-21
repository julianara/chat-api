# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.find_or_create_by(name: "User1")
user2 = User.find_or_create_by(name: "User2")
user3 = User.find_or_create_by(name: "User3")
conversation12 = Conversation.find_or_create_by({to_id: user1.id, from_id: user2.id})
conversation23 = Conversation.find_or_create_by({to_id: user2.id, from_id: user3.id})
message_1_to_2 = conversation12.messages.create({msg_text: "hi, user2", from_id: user1.id, to_id: user2.id})
message_2_to_1 = conversation12.messages.create({msg_text: "hi, user1", from_id: user2.id, to_id: user1.id})
