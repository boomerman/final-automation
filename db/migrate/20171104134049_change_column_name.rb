class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
  	rename_column :teams, :team_id, :group_id
  end
end
