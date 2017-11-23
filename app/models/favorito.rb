class Favorito < ApplicationRecord
  belongs_to :user
  belongs_to :negocio

  validates :user_id, uniqueness: { scope: :negocio_id}
end
