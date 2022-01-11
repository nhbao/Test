class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product
  
  validates :price, presence:true, numericality: {only_float: true}

  before_save :set_total

  def total
    price * quantity
  end

  private

  def set_total
    self.total = total
  end
end
