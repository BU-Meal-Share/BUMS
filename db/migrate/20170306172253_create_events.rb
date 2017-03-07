class CreateEvents < ActiveRecord::Migration
  def up
    create_table :events do |t|
      t.string :name
      t.datetime :date
      t.text :description
      t.text :ingredients
    end
  end
  def down
    drop_table :events
  end
end
