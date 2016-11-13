class AddUserIdCreatorIdToLike < ActiveRecord::Migration
  def change
    add_column :likes, :user_id, :integer
    add_column :likes, :creator_id, :integer
  end
end
