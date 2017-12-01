class VersionNegociosController < ApplicationController
before_action :set_negocio, only: [:show, :edit, :update, :destroy]
# GET /negocios
# GET /negocios.json
def index

  @negocios = VersionNegocio.all.where(aprobado: 0)

  #cambiar al directorio /public
  Dir.chdir "#{Rails.root.join('public')}"

  #iteración de todos los usuarios en el arreglo @usuarios
  @negocios.each do |n|
    # creamos una variable que va a crear en string el nombre de la foto que se va a guardar
    # ej. user_image_23.png para el usuario con id 23
    saveName = "business_image_#{n.id}.png"

    # abrimos el filestream para escritura con el nombre de la variable saveName
    fotoNegocio = File.open(saveName, 'wb') do |f|

    # el begin y rescue es el clásico try/catch
    begin
      # intentamos convertir los bytes que se reciben de la base de datos en encoding BASE64
      # y lo escribimos en el filestream usando decode64. Se guardaría en /public/user_image_23.png
      f.write(Base64.urlsafe_decode64(n.imagen))

      # cambiamos el contenido de la propiedad foto para que no sea el arreglo de bytes sino el
      # nombre con el que quedó guardado en /public/
      n.imagen=saveName

      # cerramos el stream
      f.close

    # si escribir la foto falla por algún motivo...
    rescue => ex
      # ignoramos lo que se haya jalado de la base de datos y ponemos de nombre una imagen genérica
      # esta imagen debe estar guardada eb /public/
      n.imagen="default_user_image.png"
    end
  end
end

end

# GET /negocios/1
# GET /negocios/1.json
def show
   Dir.chdir "#{Rails.root.join('public/')}"

  #iteración de todos los usuarios en el arreglo @usuarios
    # creamos una variable que va a crear en string el nombre de la foto que se va a guardar
    # ej. user_image_23.png para el usuario con id 23
    saveName = "business_image_#{@negocio_o.id}.png"

    # abrimos el filestream para escritura con el nombre de la variable saveName
    fotoUsuario = File.open(saveName, 'wb') do |f|

    # el begin y rescue es el clásico try/catch
    begin
      # intentamos convertir los bytes que se reciben de la base de datos en encoding BASE64
      # y lo escribimos en el filestream usando decode64. Se guardaría en /public/user_image_23.png
      f.write(Base64.urlsafe_decode64(@negocio_o.imagen))

      # cambiamos el contenido de la propiedad foto para que no sea el arreglo de bytes sino el
      # nombre con el que quedó guardado en /public/
      @negocio_o.imagen=saveName

      # cerramos el stream
      f.close
    # si escribir la foto falla por algún motivo...
    rescue => ex
      # ignoramos lo que se haya jalado de la base de datos y ponemos de nombre una imagen genérica
      # esta imagen debe estar guardada eb /public/
      @negocio_o.imagen="default_user_image.png"
    end
end
end

# GET /negocios/new
def new


end

# GET /negocios/1/edit
def edit

end

# POST /negocios
# POST /negocios.json
def create

end

# PATCH/PUT /negocios/1
# PATCH/PUT /negocios/1.json
def update

  @nombre_empresa = params[:nombre_empresa]
  @descripcion = params[:descripcion]
  @latitud = params[:latitud]
  @longitud = params[:longitud]
  @precio_promedio = params[:precio_promedio]
  @imagen = params[:imagen]
  @version = params[:version]
  @aprobado = params[:aprobado]
puts "****************************************************************************8"
puts @aprobado
   @negocio_o.update(:nombre_empresa => @nombre_empresa,:descripcion => @descripcion,:aprobado=> @aprobado)
    if @negocio_o.aprobado == 1
      @negocio_soli = Negocio.where("id=?", @negocio_o.negocio_id)
      @negocio_soli.each do |soli|
      puts soli.id
      puts "Entro al update"
      soli.update(:nombre_empresa => @nombre_empresa, :imagen => @imagen, :descripcion => @descripcion )
      end
    else
      puts "Nego el update"
    end



  respond_to do |format|
    format.html { redirect_to version_negocios_url, notice: 'Updated' }
    format.json { head :no_content }
  end
end

# DELETE /negocios/1
# DELETE /negocios/1.json
def destroy
  @negocio_o.destroy
  respond_to do |format|
    format.html { redirect_to negocios_url, notice: 'Negocio was successfully destroyed.' }
    format.json { head :no_content }
  end
end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_negocio
    @negocio_o = VersionNegocio.find(params[:id])
  end



  # Never trust parameters from the scary internet, only allow the white list through.
  def version_negocio_params
    params.require(:version_negocio).permit(:nombre_empresa, :latitud, :longitud, :precio_promedio, :imagen, :version, :aprobado, :negocio_id, :descripcion)
  end


end
