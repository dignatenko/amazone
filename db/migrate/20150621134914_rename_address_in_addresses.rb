class RenameAddressInAddresses < ActiveRecord::Migration
  def change
    rename_column :addresses, :address, :street
  end
end
