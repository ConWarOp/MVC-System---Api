class Interests < ActiveRecord::Migration[6.0]
  def change
      create_table :interests do |t|
      t.integer :post_id
      t.string :user_id
      t.timestamps
     end
  end
end
