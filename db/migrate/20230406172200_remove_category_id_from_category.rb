class RemoveCategoryIdFromCategory < ActiveRecord::Migration[7.0]
  def change
    remove_column :categories, :category_id, :bigint
  end
end
