class CreateVersionNegocios < ActiveRecord::Migration[5.1]
  def change
    create_table :version_negocios do |t|
      t.string :nombre_empresa
      t.float :latitud
      t.float :longitud
      t.float :precio_promedio
      t.text :imagen
      t.integer :version
      t.integer :aprobado
      t.integer :negocio_id
      t.string :descripcion

      t.timestamps
    end
  end
end
