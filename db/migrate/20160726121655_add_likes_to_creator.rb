class AddLikesToCreator < ActiveRecord::Migration
  def change
    add_column :creators, :likes, :integer
  end
end
