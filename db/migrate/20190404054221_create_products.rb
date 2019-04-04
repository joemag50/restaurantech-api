class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.numeric :price
      t.string :description

      t.timestamps
    end
  end
end
