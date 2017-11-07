class CreatePanels < ActiveRecord::Migration[5.0]
  def change
    create_table :panels do |t|
      t.string :panel_id
      t.integer :teacher_1
      t.integer :teacher_2

      t.timestamps
    end
  end
end
