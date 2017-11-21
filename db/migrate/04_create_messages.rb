class CreateMessages < ActiveRecord::Migration[5.1]
  def change

    create_table :messages do |t|
      t.text :msg_text, null: false
      t.references :conversation, foreign_key: true
      t.references :from, references: :users 
      t.references :to, references: :users
      t.timestamps
    end


  end
end
