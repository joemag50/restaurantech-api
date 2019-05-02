class OrderProduct < ApplicationRecord
  has_one :product

  before_save :save_name

  def save_name
    self.name = Product.find(self.product_id).name
  end
end
