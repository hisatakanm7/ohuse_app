class AddIndexToCreatorsName < ActiveRecord::Migration
  def change
    add_index :creators, :name, unique: true
  end
end
