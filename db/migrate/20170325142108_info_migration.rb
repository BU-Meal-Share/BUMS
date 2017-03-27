class InfoMigration < ActiveRecord::Migration
  def change
    add_column :events, :minPartySize, :integer
    add_column :events, :curPartySize, :integer
    add_column :events, :maxPartySize, :integer
    add_column :events, :tags, :string
    add_column :events, :location, :string
    add_column :events, :recipes, :text
    add_column :events, :image, :string
  end
end
