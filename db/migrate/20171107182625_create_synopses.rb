class CreateSynopses < ActiveRecord::Migration[5.0]
  def change
    create_table :synopses do |t|
      t.string :index
      t.string :create

      t.timestamps
    end
  end
end
