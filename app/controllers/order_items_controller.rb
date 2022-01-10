class OrderItemsController < ApplicationController
  before_action :set_order

  def new
    @products = Product.all
    @order_item = @order.order_items.new
  end

  def create
    @order_item = @order.order_items.new(order_params)
    @order.save
  end

  def update
    @order_item = @order.order_items.find(params[:id])
    @order_item.update(order_params)
    @order_items = @order.order_items
  end

  def destroy
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
  end

  private

  def set_order
   @order = Order.find(params[:order_id])
  end

  def order_params
    params.require(:order_item).permit(:product_id, :quantity)
  end
end
