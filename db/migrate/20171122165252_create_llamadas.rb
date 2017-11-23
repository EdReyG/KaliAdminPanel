class CreateLlamadas < ActiveRecord::Migration[5.1]
  def change
    create_table :llamadas do |t|
      t.integer :user_id
      t.integer :negocio_id
      t.datetime :fecha

      t.timestamps
    end
  end
end
