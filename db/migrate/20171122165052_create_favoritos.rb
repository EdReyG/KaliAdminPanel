class CreateFavoritos < ActiveRecord::Migration[5.1]
  def change
    create_table :favoritos do |t|
      t.integer :user_id
      t.integer :negocio_id

      t.timestamps
    end
  end
end
