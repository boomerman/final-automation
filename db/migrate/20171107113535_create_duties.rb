class CreateDuties < ActiveRecord::Migration[5.0]
  def change
    create_table :duties do |t|
      t.string :group_id
      t.string :panel_id
      t.date :date
      t.time :time
      t.text :venue

      t.timestamps
    end
  end
end
