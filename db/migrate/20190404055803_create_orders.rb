class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :client_name
      t.string :table

      t.timestamps
    end
  end
end
