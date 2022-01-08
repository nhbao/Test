class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  before_save :set_unit_price
  before_save :set_total

  def unit_price
    product.price + (product.price * product.tax / 100)
  end

  def total
    unit_price * quantity
  end

  private

  def set_unit_price
    self.unit_price = unit_price 
  end

  def set_total
    self.total = total
  end
end
