class AddCreatorRefToReviews < ActiveRecord::Migration
  def change
    add_reference :reviews, :creator, index: true, foreign_key: true
  end
end
