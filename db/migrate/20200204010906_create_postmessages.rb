class CreatePostmessages < ActiveRecord::Migration[6.0]
  def change
    create_table :postmessages do |t|
	t.integer :chat_id
 	t.text :content
      t.string :sender_id


      t.timestamps
    end
  end
end
