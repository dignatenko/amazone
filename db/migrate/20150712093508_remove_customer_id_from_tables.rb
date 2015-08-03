class RemoveCustomerIdFromTables < ActiveRecord::Migration
  def change
    remove_column :credit_cards, :customer_id
    remove_column :orders, :customer_id
    remove_column :ratings, :customer_id
  end
end
