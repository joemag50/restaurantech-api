class Product < ApplicationRecord
  belongs_to :category

  after_save :reload_order_product

  def reload_order_product
    OrderProduct.where(product_id: self.id).map { |e| e.save }
  end
end
