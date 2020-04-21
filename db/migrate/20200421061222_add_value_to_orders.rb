class AddValueToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :value, :bigint
  end
end
