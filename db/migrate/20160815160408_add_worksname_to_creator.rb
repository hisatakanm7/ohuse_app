class AddWorksnameToCreator < ActiveRecord::Migration
  def change
    add_column :creators, :worksname, :string
  end
end
