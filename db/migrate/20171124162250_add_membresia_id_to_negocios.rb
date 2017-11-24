class AddMembresiaIdToNegocios < ActiveRecord::Migration[5.1]
  def change
  	add_column :negocios, :membresia_id, :integer
  end
end
