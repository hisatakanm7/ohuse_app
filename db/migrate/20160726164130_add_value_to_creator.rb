class AddValueToCreator < ActiveRecord::Migration
  def change
    add_column :creators, :value, :integer
  end
end
