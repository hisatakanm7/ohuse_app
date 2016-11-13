class RemoveWorksGenreWorksnameWikiUserIdFromCreators < ActiveRecord::Migration
  def change
    remove_column :creators, :works, :string
    remove_column :creators, :genre, :string
    remove_column :creators, :worksname, :string
    remove_column :creators, :wiki, :string
    remove_column :creators, :user_id, :integer
  end
end
