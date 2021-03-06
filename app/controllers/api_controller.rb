class ApiController < ApplicationController
  # List categories http://localhost:3000/api/categories
  def categories
    render json: { result: true, object: Category.all }
  end

  # List categories products http://localhost:3000/api/products_category?id=3
  def products_category
    render json: { result: true, object: Product.where(category_id: params[:id]) }
  end

  # List products
  def products
    render json: { result: true, object: Product.all }
  end

  # Make order http://localhost:3000/api/new_order?order[client_name]=jose&order[table]=r12
  def new_order
    @order = Order.new order_params
    @order.save
    render json: { result: true, object: @order }
  end

  # cancel order
  def cancel_order
    @order = Order.find(params[:id])
    @order.destroy
    render json: { result: true }
  end

  # New Order product http://localhost:3000/api/new_order_product?order_product[order_id]=1&order_product[product_id]=1
  def new_order_product
    @order_product = OrderProduct.new order_product_params

    if @order_product.save
      render json: { result: true, object: @order_product }
    else
      render json: { result: false, object: @order_product.errors }
    end
  end

  # Destroy Order product http://localhost:3000/api/destroy_order_product?order_product[order_id]=1&order_product[product_id]=1
  def destroy_order_product
    @order_product = OrderProduct.find_by order_product_params
    unless @order_product
      render json: { result: true, object: 'No existe' }
      return;
    end

    if @order_product.destroy
      render json: { result: true, object: @order_product }
    else
      render json: { result: false, object: @order_product.errors }
    end
  end

  # Consult order
  def order
    order = {}
    @order = Order.find(params[:id])
    order[:order] = @order
    order[:order_products] = @order.order_products
    order[:total] = @order.total.to_s
    render json: { result: true, object: order }
  end

  # Pay order
  def finish_order
  end

  private

  def order_params
    params.require(:order).permit(:client_name, :table)
  end

  def order_product_params
    params.require(:order_product).permit(:order_id, :product_id)
  end
end
