class AddBillingAmountsToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :billing_amount, :string
  end
end
