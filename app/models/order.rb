class Order < ApplicationRecord
  has_many :order_products

  def total
    total = 0.00
    order_products.each { |op| total += op.product.price }
    total
  end
end
