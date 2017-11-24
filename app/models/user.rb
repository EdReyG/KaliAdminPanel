class User < ApplicationRecord
  has_many :negocios
  has_many :favorito
  has_many :llamada
  has_many :pendiente
 	def password_salt
   		'no salt'
	end

	def password_salt=(new_salt)
	end

  def name_with_initial
    "#{name}  #{apellidos} con email: #{email}"
  end
end
