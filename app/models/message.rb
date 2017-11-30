class Message < ApplicationRecord
	belongs_to :from, class_name: "User", foreign_key: "from_id"
	belongs_to :to, class_name: "User", foreign_key: "to_id"
	belongs_to :conversation

	validates :msg_text, :conversation_id, :from_id, :to_id, presence: true

	# private
	# def msg_time
	# 	created_at.strftime("%-m/%-d/%y %l:%M %p")
	# end
end
