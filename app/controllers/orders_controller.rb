class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :destroy]

  def index
    @orders = Order.all
  end

  def show
    @order_items = @order.order_items
  end

  def new
    @order = Order.create
    redirect_to new_order_order_item_path(@order)
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end
end
