class CreateCreators < ActiveRecord::Migration
  def change
    create_table :creators do |t|
      t.integer :user_id
      t.string :name
      t.string :description
      t.string :tag

      t.timestamps null: false
    end
  end
end
