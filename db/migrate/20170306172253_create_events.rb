class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string 'name'
      t.datetime 'date'
      t.text 'description'
      t.text 'ingredients'
    end
  end
end
