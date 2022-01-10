class ExportOrdersController < ApplicationController
  before_action :get_order

  def index
    csv = ExportCsvService.new @order_arr, Order::CSV_ATTRIBUTES
    respond_to do |format|
      format.csv { send_data csv.perform,
        filename: "order_#{Time.now.to_i}.csv" }
    end
  end

  private

  def get_order
    @order = Order.find(params[:id])
    @order_arr = []
    @order.order_items.each do |i|
      @order_arr << {quantity: i.quantity, name: i.product.name, price: i.total.round(2)}
    end
    @order_arr << {sales_taxes: @order.sales_taxes, total: @order.total.round(2)}
  end
end
