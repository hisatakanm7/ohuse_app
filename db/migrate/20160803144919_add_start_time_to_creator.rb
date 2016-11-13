class AddStartTimeToCreator < ActiveRecord::Migration
  def change
    add_column :creators, :start_time, :datetime
  end
end
