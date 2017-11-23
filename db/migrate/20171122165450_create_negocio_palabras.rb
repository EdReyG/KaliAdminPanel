class CreateNegocioPalabras < ActiveRecord::Migration[5.1]
  def change
    create_table :negocio_palabras do |t|
      t.integer :negocio_id
      t.integer :palabra_clave_id

      t.timestamps
    end
  end
end
