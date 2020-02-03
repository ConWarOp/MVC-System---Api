class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text :content
      t.string :sender_id
      t.string :receiver_id


      t.timestamps
    end
  end
end
