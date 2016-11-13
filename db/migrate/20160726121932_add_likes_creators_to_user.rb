class AddLikesCreatorsToUser < ActiveRecord::Migration
  def change
    add_column :users, :likes, :integer
    add_column :users, :creators, :integer
  end
end
