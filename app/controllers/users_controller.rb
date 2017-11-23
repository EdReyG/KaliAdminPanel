class UsersController < ApplicationController
  require "base64"
  include ActiveSupport
  require "digest"
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]


  # GET /usuarios
  # GET /usuarios.json

  def index

   #obtener todos los usuarios y pasarlos a la variable @usuarios
    @usuarios = User.where(activo: true).order(:apellidos)

    #cambiar al directorio /public
    Dir.chdir "#{Rails.root.join('public')}"

    #iteración de todos los usuarios en el arreglo @usuarios
    @usuarios.each do |u|
      # creamos una variable que va a crear en string el nombre de la foto que se va a guardar
      # ej. user_image_23.png para el usuario con id 23
      saveName = "user_image_#{u.id}.png"

      # abrimos el filestream para escritura con el nombre de la variable saveName
      fotoUsuario = File.open(saveName, 'wb') do |f|

      # el begin y rescue es el clásico try/catch
      begin
        # intentamos convertir los bytes que se reciben de la base de datos en encoding BASE64
        # y lo escribimos en el filestream usando decode64. Se guardaría en /public/user_image_23.png
        f.write(Base64.urlsafe_decode64(u.foto))

        # cambiamos el contenido de la propiedad foto para que no sea el arreglo de bytes sino el
        # nombre con el que quedó guardado en /public/
        u.foto=saveName

        # cerramos el stream
        f.close

      # si escribir la foto falla por algún motivo...
      rescue => ex
        # ignoramos lo que se haya jalado de la base de datos y ponemos de nombre una imagen genérica
        # esta imagen debe estar guardada eb /public/
        u.foto="default_user_image.png"
      end
    end

  end




  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show

    Dir.chdir "#{Rails.root.join('public/')}"

    #iteración de todos los usuarios en el arreglo @usuarios
      # creamos una variable que va a crear en string el nombre de la foto que se va a guardar
      # ej. user_image_23.png para el usuario con id 23
      saveName = "user_image_#{@usuario.id}.png"

      # abrimos el filestream para escritura con el nombre de la variable saveName
      fotoUsuario = File.open(saveName, 'wb') do |f|

      # el begin y rescue es el clásico try/catch
      begin
        # intentamos convertir los bytes que se reciben de la base de datos en encoding BASE64
        # y lo escribimos en el filestream usando decode64. Se guardaría en /public/user_image_23.png
        f.write(Base64.urlsafe_decode64(@usuario.foto))

        # cambiamos el contenido de la propiedad foto para que no sea el arreglo de bytes sino el
        # nombre con el que quedó guardado en /public/

        if  @usuario.foto != ""

        # cambiamos el contenido de la propiedad foto para que no sea el arreglo de bytes sino el
        # nombre con el que quedó guardado en /public/
        @usuario.foto=saveName

      else
        @usuario.foto="default_user_image.png"
      end

        # cerramos el stream
        f.close
      # si escribir la foto falla por algún motivo...
      rescue => ex
        # ignoramos lo que se haya jalado de la base de datos y ponemos de nombre una imagen genérica
        # esta imagen debe estar guardada eb /public/
        @usuario.foto="default_user_image.png"
      end
  end
  end

  # GET /usuarios/new
  def new
    @usuario = User.new

  end

  # GET /usuarios/1/edit
  def edit
  end

  # POST /usuarios
  # POST /usuarios.json
  def create

    @usuario = User.new(usuario_params)
    contra = @usuario[:contrasena]
    puts contra
    @usuario[:contrasena] = Digest::SHA256.base64digest '#{contra}'
    puts @usuario[:contrasena]

    respond_to do |format|
      if @usuario.save

        format.html { redirect_to @usuario, notice: 'Usuario was successfully created.' }
        format.json { render :show, status: :created, location: @usuario }

      else
        format.html { render :new }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usuarios/1
  # PATCH/PUT /usuarios/1.json
  def update
    respond_to do |format|
      if @usuario.update(usuario_params)
        format.html { redirect_to @usuario, notice: 'Usuario was successfully updated.' }
        format.json { render :show, status: :ok, location: @usuario }
      else
        format.html { render :edit }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end

    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    @usuario.destroy
    respond_to do |format|
      format.html { redirect_to usuarios_url, notice: 'Usuario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usuario_params
      params.require(:user).permit(:nombre_usuario, :apellidos,  :correo, :contrasena, :activo, :tipo, :foto)
    end

    def venta_params
      params.require(:venta).permit(:usuario_id_venta, :vendedor_id)
    end

end
