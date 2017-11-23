class CreateHorarios < ActiveRecord::Migration[5.1]
  def change
    create_table :horarios do |t|
      t.integer :negocio_id
      t.time :hora_inicio
      t.time :hora_fin
      t.integer :dia

      t.timestamps
    end
  end
end
