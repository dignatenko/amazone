class ChangeStateInOrders < ActiveRecord::Migration
  def change
    rename_column :orders, :state, :aasm_state
  end
end
