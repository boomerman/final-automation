class AddGroupIdToFriendships < ActiveRecord::Migration[5.0]
  def change
    add_column :friendships, :group_id, :string
  end
end
