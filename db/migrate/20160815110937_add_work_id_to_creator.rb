class AddWorkIdToCreator < ActiveRecord::Migration
  def change
    add_column :creators, :work_id, :integer
  end
end
