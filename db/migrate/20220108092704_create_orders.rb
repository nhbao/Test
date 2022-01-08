class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.decimal :sales_taxes, precision: 7, scale: 2
      t.decimal :total, precision: 7, scale: 2

      t.timestamps
    end
  end
end
