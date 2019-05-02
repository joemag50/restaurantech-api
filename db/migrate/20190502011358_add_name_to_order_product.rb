class AddNameToOrderProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :order_products, :name, :string
  end
end
