class ConversationSerializer < ActiveModel::Serializer
  attributes :id, :from, :to
  has_many :messages 
end

