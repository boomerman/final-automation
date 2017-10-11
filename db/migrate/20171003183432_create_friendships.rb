class CreateFriendships < ActiveRecord::Migration[5.0]
  def change
    create_table :friendships do |t|
      t.references :user, foreign_key: true
      t.references :friend, foreign_key: true
      t.integer :user_roll
      t.integer :friend_roll
      t.integer :guide
     
      t.timestamps
    end
  end
end
