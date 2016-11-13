class AddImagevalueToCreator < ActiveRecord::Migration
  def change
    add_column :creators, :imagevalue, :string
  end
end
