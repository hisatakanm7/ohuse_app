class AddActiveToWork < ActiveRecord::Migration
  def change
    add_column :works, :active, :boolean, :null => false, :default => false
  end
end
