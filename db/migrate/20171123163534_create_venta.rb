class CreateVenta < ActiveRecord::Migration[5.1]
  def change
    create_table :venta do |t|
      t.integer :user_id
      t.integer :vendedor_id

      t.timestamps
    end
  end
end
