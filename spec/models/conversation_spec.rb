require 'rails_helper'

RSpec.describe Conversation, type: :model do

 describe "#valid?" do 
    let (:user1) {User.find_or_create_by(name: "User1")}
    let (:user2) {User.find_or_create_by(name: "User2")}
    let (:user3) {User.find_or_create_by(name: "User3")}

    it "between two users" do
      expect(Conversation.create({to_id: user1.id, from_id: user2.id})).to be_valid
    end

    it "is between the same user" do
      expect(Conversation.create({to_id: user1.id, from_id: user1.id})).to be_valid
    end

    it "between users that already have convo" do
      Conversation.create({to_id: user1.id, from_id: user2.id})
      expect(Conversation.create({to_id: user1.id, from_id: user2.id})).to be_invalid
    end

    it "between user and user that doesn't exist" do 
      expect(Conversation.create({to_id: user1.id})).to be_invalid
    end

    it "no users" do 
      expect(Conversation.create).to be_invalid
    end
  end

  describe "Associations" do 
    it "should have_many :messages" do
      expect(Conversation.reflect_on_association(:messages).macro).to eq :has_many
    end

    it "should belong_to user" do
      expect(Conversation.reflect_on_association(:to).macro).to eq :belongs_to
      expect(Conversation.column_names).to include "to_id"
      expect(Conversation.column_names).to include "from_id"
    end
  end

end


