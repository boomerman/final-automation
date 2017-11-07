class AddFieldsToSynopses < ActiveRecord::Migration[5.0]
  def change
    add_column :synopses, :group_id, :string
    add_column :synopses, :title, :string
    add_column :synopses, :ipdr, :string
    add_column :synopses, :opw, :string
    add_column :synopses, :meth, :string
  end
end
