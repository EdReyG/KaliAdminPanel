class CreateMembresia < ActiveRecord::Migration[5.1]
  def change
    create_table :membresia do |t|
      t.string :nombre
      t.integer :metros_alcance
      t.string :descripcion
      t.float :precio

      t.timestamps
    end
  end
end
