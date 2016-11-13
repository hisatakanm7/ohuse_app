class AddUserRefToCreators < ActiveRecord::Migration
  def change
    add_reference :creators, :user, index: true, foreign_key: true
  end
end
