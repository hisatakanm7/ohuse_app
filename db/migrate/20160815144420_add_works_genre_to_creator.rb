class AddWorksGenreToCreator < ActiveRecord::Migration
  def change
    add_column :creators, :works, :string
    add_column :creators, :genre, :string
  end
end
