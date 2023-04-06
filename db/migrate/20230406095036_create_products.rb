class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :image
      t.string :description
      t.string :category
      t.integer :original_price
      t.integer :selling_price
      t.integer :rating
      t.boolean :in_stock

      t.timestamps
    end
  end
end
