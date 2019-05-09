class AddOrderProductState < ActiveRecord::Migration[5.2]
  def change
    add_column :order_products, :state, :integer
  end
end
