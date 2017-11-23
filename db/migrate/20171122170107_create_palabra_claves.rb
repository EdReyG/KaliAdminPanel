class CreatePalabraClaves < ActiveRecord::Migration[5.1]
  def change
    create_table :palabra_claves do |t|
      t.string :palabra

      t.timestamps
    end
  end
end
