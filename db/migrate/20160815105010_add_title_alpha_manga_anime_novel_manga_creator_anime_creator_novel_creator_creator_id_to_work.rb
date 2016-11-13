class AddTitleAlphaMangaAnimeNovelMangaCreatorAnimeCreatorNovelCreatorCreatorIdToWork < ActiveRecord::Migration
  def change
    add_column :works, :title, :string
    add_column :works, :alpha, :string
    add_column :works, :manga, :string
    add_column :works, :anime, :string
    add_column :works, :novel, :string
    add_column :works, :manga_creator, :string
    add_column :works, :anime_creator, :string
    add_column :works, :novel_creator, :string
    add_column :works, :creator_id, :integer
  end
end
