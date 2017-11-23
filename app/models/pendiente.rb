class Pendiente < ApplicationRecord
  belongs_to :user
	belongs_to :negocio
end
