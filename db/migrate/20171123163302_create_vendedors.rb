class CreateVendedors < ActiveRecord::Migration[5.1]
  def change
    create_table :vendedors do |t|
      t.string :codigo
      t.integer :user_id
      t.date :fecha
      t.datetime :fecha_venta

      t.timestamps
    end
  end
end
