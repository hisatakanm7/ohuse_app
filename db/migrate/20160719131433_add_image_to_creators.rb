class AddImageToCreators < ActiveRecord::Migration
  def change
    add_column :creators, :image, :string
  end
end
