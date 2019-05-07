class Order < ApplicationRecord
  has_many :order_products, dependent: :destroy

  def total
    total = 0.00
    order_products.each { |op| total += op.product.price }
    total
  end
end
