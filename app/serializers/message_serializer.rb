class MessageSerializer < ActiveModel::Serializer
  attributes :id, :to, :from, :msg_text, :created_at
  belongs_to :to
  belongs_to :from
end
