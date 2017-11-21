require 'rails_helper'

RSpec.describe Message, type: :model do

  describe "#valid?" do 
    let (:user1) {User.find_or_create_by(name: "User1")}
    let (:user2) {User.find_or_create_by(name: "User2")}
    let (:user3) {User.find_or_create_by(name: "User3")}
    let (:conversation12) {Conversation.find_or_create_by(from_id: user1.id, to_id: user2.id)}

    it "when msg text is valid" do
      expect(Message.new({msg_text: "sup, bruh", from_id: user2.id, to_id: user1.id, conversation_id: conversation12.id})).to be_valid
    end

    it "when msg text is empty str" do
      expect(conversation12.messages.new({msg_text: "", from_id: user1.id, to_id: user1.id, conversation_id: conversation12.id})).to be_invalid
    end

    it "when msg text is space" do
      expect(conversation12.messages.new({msg_text: " ", from_id: user2.id, to_id: user1.id, conversation_id: conversation12.id})).to be_invalid
    end

    it "when there is no msg text" do 
      expect(conversation12.messages.new({from_id: user2.id, to_id: user1.id, conversation_id: conversation12.id})).to be_invalid
    end

    it "when msg text is one char" do 
      expect(conversation12.messages.new({msg_text: "a", from_id: user2.id, to_id: user1.id, conversation_id: conversation12.id})).to be_valid
    end

    it "when msg text begins w space" do 
      expect(conversation12.messages.new({msg_text: "  sup", from_id: user2.id, to_id: user1.id, conversation_id: conversation12.id})).to be_valid
    end

    it "has no recipient" do 
      expect(conversation12.messages.new({msg_text: "hi", from_id: user2.id, conversation_id: conversation12.id})).to be_invalid
    end

    it "has no sender" do 
      expect(conversation12.messages.new({msg_text: "ugh", to_id: user2.id, conversation_id: conversation12.id})).to be_invalid
    end

    it "has no participants" do 
      expect(conversation12.messages.new({msg_text: "sup", conversation_id: conversation12.id})).to be_invalid
    end
  end

  describe "Associations" do 
    it "should belong_to conversation" do
      expect(Message.reflect_on_association(:conversation).macro).to eq :belongs_to
    end 

    it "should belong_to user" do
      expect(Message.reflect_on_association(:to).macro).to eq :belongs_to
      expect(Message.column_names).to include "to_id"
      expect(Message.column_names).to include "from_id"
    end
  end
end

