class CreateComentarios < ActiveRecord::Migration[5.1]
  def change
    create_table :comentarios do |t|
      t.integer :user_id
      t.integer :negocio_id
      t.string :comentario

      t.timestamps
    end
  end
end
