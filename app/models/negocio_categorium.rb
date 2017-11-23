class NegocioCategorium < ApplicationRecord
  self.table_name = "negocios_categorias"

  belongs_to :categoria
  belongs_to :negocio
end
