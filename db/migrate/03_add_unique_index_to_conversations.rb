
class AddUniqueIndexToConversations <  ActiveRecord::Migration[5.1]
  def change
    add_index :conversations, [:from_id, :to_id], unique: true
  end
end


