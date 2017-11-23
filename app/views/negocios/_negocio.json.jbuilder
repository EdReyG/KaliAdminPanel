json.extract! negocio, :id, :nombre_empresa, :latitud, :longitud, :verificado, :precio_promedio, :rating_precio, :rating_calidad, :imagen, :cantidad_rating, :cantidad_precio, :ultima_conexion, :fecha_registro, :usuario_id
json.url negocio_url(negocio, format: :json)
