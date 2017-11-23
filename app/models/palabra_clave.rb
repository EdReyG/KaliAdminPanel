class PalabraClave < ApplicationRecord
  has_many :negocio_palabra
  has_many :negocios, :through => :negocio_palabra
  validates :palabra, uniqueness: true
end
