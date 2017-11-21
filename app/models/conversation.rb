class Conversation < ApplicationRecord
	belongs_to :from, class_name: "User", foreign_key: "from_id"
	belongs_to :to, class_name: "User", foreign_key: "to_id"
	has_many :messages, dependent: :destroy 

	validates :from_id, uniqueness: {scope: :to_id}

	scope :from_or_to, -> (from_id, to_id) { where("(to_id = ? AND from_id = ?) 
        OR (to_id = ? AND from_id = ?)", to_id, from_id, from_id, to_id) }
end
