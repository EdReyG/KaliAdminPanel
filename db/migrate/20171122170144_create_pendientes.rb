class CreatePendientes < ActiveRecord::Migration[5.1]
  def change
    create_table :pendientes do |t|
      t.integer :user_id
      t.integer :negocio_id
      t.boolean :pendiente

      t.timestamps
    end
  end
end
