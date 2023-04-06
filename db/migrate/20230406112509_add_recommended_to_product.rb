class AddRecommendedToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :recommended, :boolean, :default => false
  end
end
