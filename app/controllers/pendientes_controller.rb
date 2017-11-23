class PendientesController < ApplicationController

  def index
  	 @negocios = Negocio.all.where(verificado: 0).order(:nombre_empresa)

  	 @promociones = Promocion.all.where(aprobada: 0).order(:fecha_registro)

  	

  end

  private
  	def check_if_user_active

    end
end
