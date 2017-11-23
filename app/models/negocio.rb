class Negocio < ApplicationRecord
  belongs_to :user
	has_many :negocio_palabra
	has_many :categoria
  has_many :palabra_clave, :through => :negocio_palabra
  has_many :categoria, :through => :negocio_categoria
  has_many :promocion
  has_many :comentarios
  has_many :horario
  has_many :llamada
  has_many :pendiente
end
