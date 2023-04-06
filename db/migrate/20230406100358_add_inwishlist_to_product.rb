class AddInwishlistToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :in_wishlist, :boolean, :default => false
  end
end
