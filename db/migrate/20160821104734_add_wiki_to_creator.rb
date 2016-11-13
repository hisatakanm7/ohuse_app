class AddWikiToCreator < ActiveRecord::Migration
  def change
    add_column :creators, :wiki, :boolean
  end
end
