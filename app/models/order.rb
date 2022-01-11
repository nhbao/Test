class Order < ApplicationRecord
  has_many :order_items
  before_save :set_total, :set_sales_taxes

  CSV_ATTRIBUTES = %w(quantity name price).freeze
  CSV_ATTRIBUTES_ORDER = %w(sales_taxes total).freeze

  def sales_taxes
    taxes = order_items.collect{ |i| i.valid? ? 
                         (i.price - (i.price / (1 + i.product.tax/100))) * i.quantity  :
                         0
                       }.sum 
    (taxes * 20).round / 20.0
  end
  
  def total
    order_items.collect{ |i| i.valid? ? 
                         i.total.to_f :
                         0
                       }.sum
  end
  # ((i.price - (i.price / (1 + i.product.tax/100))) * i.quantity * 20).round / 20.0
  private

  def set_total
    self.total = total
  end

  def set_sales_taxes
    self.sales_taxes = sales_taxes
  end
end
