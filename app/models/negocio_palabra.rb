class NegocioPalabra < ApplicationRecord
  belongs_to :negocio
	belongs_to :palabra_clave
end
