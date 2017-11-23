class CreateNegocioCategoria < ActiveRecord::Migration[5.1]
  def change
    create_table :negocio_categoria do |t|
      t.integer :categoria_id
      t.integer :negocio_id

      t.timestamps
    end
  end
end
