class AddAdminToCustomers < ActiveRecord::Migration[7.0]
  def change
    add_column :customers, :admin, :boolean, :default => false
  end
end
