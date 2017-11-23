class CreateNegocios < ActiveRecord::Migration[5.1]
  def change
    create_table :negocios do |t|
      t.string :nombre_empresa
      t.float :latitud
      t.float :longitud
      t.integer :verificado
      t.integer :precio_promedio
      t.float :rating_precio
      t.float :rating_calidad
      t.text :imagen
      t.integer :cantidad_rating
      t.integer :cantidad_precio
      t.datetime :ultima_conexion
      t.datetime :fecha_registro
      t.string :descripcion
      t.string :telefono
      t.integer :user_id
      t.integer :veces_visto

      t.timestamps
    end
  end
end
