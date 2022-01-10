class Order < ApplicationRecord
  has_many :order_items
  before_save :set_total, :set_sales_taxes

  def sales_taxes
    order_items.collect{ |i| i.valid? ? 
                         ((i.total - i.product.price * i.quantity) * 20).round / 20.0 :
                         0
                       }.sum
  end
  
  def total
    order_items.collect{ |i| i.valid? ? 
                         i.total.to_f :
                         0
                       }.sum
  end

  private

  def set_total
    self.total = total
  end

  def set_sales_taxes
    self.sales_taxes = sales_taxes
  end
end
