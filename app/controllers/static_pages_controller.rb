class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      redirect_to app_path
    end
  end

  def app
    @order_products = OrderProduct.where(state: 0)
  end
end
