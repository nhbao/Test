class Order < ApplicationRecord
  has_many :order_items
  before_save :set_sales_taxes

  def sales_taxes
    order_items.collect{ |i| i.valid? ? 
                         ((i.total - i.product.price * i.quantity) *20).round / 20.0 :
                         0
                       }.sum
  end

  private

  def set_sales_taxes
      self.sales_taxes = sales_taxes
  end
end
