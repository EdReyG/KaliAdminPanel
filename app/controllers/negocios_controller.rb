class NegociosController < ApplicationController
  before_action :set_negocio, only: [:show, :edit, :update, :destroy]


  # GET /negocios
  # GET /negocios.json
  def index
    @negocios = Negocio.all.includes(:user).where(verificado: 1)

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
      saveName = "business_image_#{@negocio.id}.png"

      # abrimos el filestream para escritura con el nombre de la variable saveName
      fotoUsuario = File.open(saveName, 'wb') do |f|

      # el begin y rescue es el clásico try/catch
      begin
        # intentamos convertir los bytes que se reciben de la base de datos en encoding BASE64
        # y lo escribimos en el filestream usando decode64. Se guardaría en /public/user_image_23.png
        f.write(Base64.urlsafe_decode64(@negocio.imagen))

        # cambiamos el contenido de la propiedad foto para que no sea el arreglo de bytes sino el
        # nombre con el que quedó guardado en /public/
        @negocio.imagen=saveName

        # cerramos el stream
        f.close
      # si escribir la foto falla por algún motivo...
      rescue => ex
        # ignoramos lo que se haya jalado de la base de datos y ponemos de nombre una imagen genérica
        # esta imagen debe estar guardada eb /public/
        @negocio.imagen="default_user_image.png"
      end
  end
  end

  # GET /negocios/new
  def new
    @negocio = Negocio.new
    @lng = negocio_params[:longitud]
    @lat = negocio_params[:latitud]
  end

  # GET /negocios/1/edit
  def edit
  end

  # POST /negocios
  # POST /negocios.json
  def create
    @negocio = Negocio.new(negocio_params)

    respond_to do |format|
      if @negocio.save
        @categoria_neg = $cat_temporal
        @negocio_cat = Negocio.where("usuario_id=?", negocio_params[:usuario_id]).where("nombre_empresa=?", negocio_params[:nombre_empresa])
        @negocio_cat.each do |neg|

          @categoria_neg.each do |cat|
            NegociosCategorias.create(:categoria_id => cat.id , :negocio_id => neg.id)
          end
        end
        format.html { redirect_to @negocio, notice: 'Negocio was successfully created.' }
        format.json { render :show, status: :created, location: @negocio }
      else
        format.html { render :new }
        format.json { render json: @negocio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /negocios/1
  # PATCH/PUT /negocios/1.json
  def update
    respond_to do |format|
      if @negocio.update(negocio_params)
        format.html { redirect_to '/negocio_web/edit', notice: 'Negocio was successfully updated.' }
        format.json { render :show, status: :ok, location: '/negocio_web/edit' }
      else
        format.html { render :edit }
        format.json { render json: @negocio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /negocios/1
  # DELETE /negocios/1.json
  def destroy
    @negocio.destroy
    respond_to do |format|
      format.html { redirect_to negocios_url, notice: 'Negocio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_negocio
      @negocio = Negocio.find(params[:id])
    end



    # Never trust parameters from the scary internet, only allow the white list through.
    def negocio_params
      params.require(:negocio).permit(:nombre_empresa, :latitud, :longitud, :verificado, :precio_promedio, :rating_precio, :rating_calidad, :imagen, :cantidad_rating, :cantidad_precio, :ultima_conexion, :fecha_registro, :usuario_id, :veces_visto, :membresia_id, :telefono, :descripcion)
    end


end