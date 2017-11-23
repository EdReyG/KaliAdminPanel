class CreatePromocions < ActiveRecord::Migration[5.1]
  def change
    create_table :promocions do |t|
      t.string :nombre
      t.string :descripcion
      t.integer :aprobada
      t.text :poster
      t.datetime :fecha_registro
      t.integer :negocio_id

      t.timestamps
    end
  end
end
