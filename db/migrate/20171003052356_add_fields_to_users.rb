class AddFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :college_roll, :integer
    add_column :users, :uni_roll, :integer
    add_column :users, :year, :string
    add_column :users, :branch, :string
    add_column :users, :course, :string
    

  end
end
