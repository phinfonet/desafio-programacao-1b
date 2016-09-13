class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :buyer
      t.string :description
      t.float :unit_price
      t.integer :quantity
      t.string :address
      t.string :supplier

      t.timestamps
    end
  end
end
