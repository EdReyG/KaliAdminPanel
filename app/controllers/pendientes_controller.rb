class PendientesController < ApplicationController
	before_action :authenticate_user!
	before_action :check_if_user_active
  def index
  	 @negocios = Negocio.all.where(verificado: 0).order(:nombre_empresa)

  	 @promociones = Promocion.all.where(aprobada: 0).order(:fecha_registro)

  	 @actualizaciones = VersionNegocio.all.where(aprobado: 0)

  end

  private
  	def check_if_user_active
      if !current_user.active?
        sign_out current_user
        flash[:alert] = "El usuario no ha sido validado por el administrador."
        redirect_to new_user_session_path
      end
    end
end
