class RemoveCreatorIdFromReviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :creator_id, :integer
  end
end
