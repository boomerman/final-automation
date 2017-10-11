class CreateFriendRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :friend_requests do |t|
      t.references :user, foreign_key: true
      t.references :friend, foreign_key: true
      t.boolean :accepted, default: false
      t.boolean :rejected, default: false
      t.boolean :pending, default: true
      t.integer :sender_roll_no
      t.integer :friend_roll_no

      t.timestamps
    end
  end
end
