class Message < ApplicationRecord
	belongs_to :from, class_name: "User", foreign_key: "from_id"
	belongs_to :to, class_name: "User", foreign_key: "to_id"
	belongs_to :conversation

	validates_presence_of :msg_text, :conversation_id, :from_id, :to_id

	# private
	# def msg_time
	# 	created_at.strftime("%-m/%-d/%y %l:%M %p")
	# end
end
