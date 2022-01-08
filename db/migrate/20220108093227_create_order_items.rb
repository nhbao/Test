class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.integer :quantity
      t.integer :product_id
      t.integer :order_id
      t.decimal :total, precision: 7, scale: 2
      t.decimal :unit_price, precision: 7, scale: 2
      
      t.timestamps
    end
  end
end
