json.extract! usuario, :id, :nombre_usuario, :apellidos, :correo, :contrasena, :activo, :tipo, :foto
json.url usuario_url(usuario, format: :json)
