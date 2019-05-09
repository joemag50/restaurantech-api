class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product

  enum state: %i[ordered prepared]
  before_save :save_name
  before_create :save_state

  def save_name
    self.name = Product.find(self.product_id).name
  end

  def save_state
    self.state = 0
  end
end
