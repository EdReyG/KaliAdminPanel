class RechazadosController < ApplicationController

  def negocios
  	@negocios = Negocio.all.includes(:user).where(verificado: -1).order(:nombre_empresa)
  end

  def promociones
  	@promociones = Promocion.all.includes(:negocio).where(aprobada: -1).order(fecha_registro: :desc)
  end

  private
    def check_if_user_active

    end
end
