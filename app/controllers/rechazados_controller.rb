class RechazadosController < ApplicationController

  def users
  	@usuarios = User.where(activo: false).order(:apellidos)
  end

  def negocios
  	@negocios = Negocio.all.includes(:usuario).where(verificado: -1).order(:nombre_empresa)
  end

  def promociones
  	@promociones = Promocion.all.includes(:negocio).where(aprobada: -1).order(fecha_registro: :desc)
  end

  def actualizaciones

  end

  private
    def check_if_user_active

    end
end
