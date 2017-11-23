class Vendedor < ApplicationRecord
  belongs_to :user
	has_many :ventum
  validates :codigo, uniqueness: true
end
