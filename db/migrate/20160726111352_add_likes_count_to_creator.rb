class AddLikesCountToCreator < ActiveRecord::Migration
  def change
    add_column :creators, :likes_count, :integer
  end
end
