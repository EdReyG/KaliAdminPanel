class Categoria < ApplicationRecord
  self.table_name="categorias"
  has_many :negocios_categorias
  has_many :negocios, :through => :negocios_categorias
end
