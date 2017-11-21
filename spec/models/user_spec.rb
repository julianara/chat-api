require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#valid?" do 

    it "when name is valid" do
      expect(User.new(name: "username1")).to be_valid
    end

    it "when name is only spaces" do
      expect(User.new(name: "   ")).to be_invalid
    end

    it "when name is empty" do
      expect(User.new(name: "")).to be_invalid
    end

    it "when there is no name" do 
      expect(User.new).to be_invalid
    end

    context "two users" do
      it "with same name" do
        User.create(name: "name1")
        user = User.new(name: "name1")
        expect(user).to be_invalid
      end

      it "with different name" do
        User.create(name: "name1")
        user = User.new(name: "name2")
        expect(user).to be_valid
      end

    end  
  end

  describe "Associations" do 
    it "should have many conversations" do
      assc = User.reflect_on_association(:conversations)
      expect(assc.macro).to eq :has_many
    end
  end
end
