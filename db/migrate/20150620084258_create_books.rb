class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.float :price
      t.integer :count_in_stock

      t.timestamps null: false
    end
  end
end
