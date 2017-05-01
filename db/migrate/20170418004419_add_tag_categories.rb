class AddTagCategories < ActiveRecord::Migration
  def change
    remove_column :events, :tags
    add_column :events, :ethnicity, :string
    add_column :events, :dietary_restrictions, :string 
    add_column :events, :category, :string
   
  end
end
