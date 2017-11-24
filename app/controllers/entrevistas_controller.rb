class EntrevistasController < ApplicationController


  # GET /vendedors
  # GET /vendedors.json
  def index
    #@vendedors = Vendedor.all.includes(:usuario)
    @vendedors = Vendedor.find_by_sql("SELECT v.*, u.* FROM  vendedors v, users u WHERE v.user_id = u.id");
    @usuarios = User.where(tipo: "v")
  end

  # GET /vendedors/1
  # GET /vendedors/1.json
  def show
    @usuario = User.find(@vendedor.user_id)
    #@vendidos = Ventum.where(vendedor_id: @usuario_id).includes(:usuarios)
    #cadSQL = "SELECT u.nombre_usuario, u.apellidos, u.celular, v.fecha_venta FROM Kali_Base.usuarios u, Kali_Base.venta v WHERE  v.vendedor_id = "+@vendedor.usuario_id.to_s;
    cadSQL = "SELECT u.nombre_usuario, u.apellidos, u.celular, v.fecha_venta FROM Kali_Base.usuarios u, Kali_Base.venta v WHERE v.user_id = u.id AND v.vendedor_id = "+(@vendedor.usuario_id.to_s) +" order by fecha_venta DESC";
    @vendidos = Ventum.find_by_sql(cadSQL);

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

        if  @promocion.poster != ""

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

  # GET /vendedors/new
  def new
    @vendedor = Vendedor.new
  end

  # GET /vendedors/1/edit
  def edit
  end

  def entrevista

  end

  # POST /vendedors
  # POST /vendedors.json
  def create
    @vendedor = Vendedor.new(vendedor_params)

    respond_to do |format|
      if @vendedor.save
        format.html { redirect_to @vendedor, notice: 'Vendedor was successfully created.' }
        format.json { render :show, status: :created, location: @vendedor }
      else
        format.html { render :new }
        format.json { render json: @vendedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vendedors/1
  # PATCH/PUT /vendedors/1.json
  def update
    respond_to do |format|
      if @vendedor.update(vendedor_params)
        format.html { redirect_to @vendedor, notice: 'Vendedor was successfully updated.' }
        format.json { render :show, status: :ok, location: @vendedor }
      else
        format.html { render :edit }
        format.json { render json: @vendedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vendedors/1
  # DELETE /vendedors/1.json
  def destroy
    @vendedor.destroy
    respond_to do |format|
      format.html { redirect_to vendedors_url, notice: 'Vendedor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vendedor
      @vendedor = Vendedor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vendedor_params
      params.require(:vendedor).permit(:codigo, :user_id)
    end

    def check_if_user_active

    end
end
