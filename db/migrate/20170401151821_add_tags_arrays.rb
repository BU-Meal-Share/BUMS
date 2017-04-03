class InfoMigration < ActiveRecord::Migration
  def change
    add_column :events, :tagsArray, :string
  end
end
