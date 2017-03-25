class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :name
      t.text :password
    end
  end
  def down
    drop_table :users
  end
end
