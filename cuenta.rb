require_relative './logueado.rb'
require_relative './deslogueado.rb'
require_relative './texto_plano.rb'
require_relative './caesar_cipher.rb'
require_relative './bcrypt.rb'
require_relative './usuario.rb'
require_relative './usuario_existente_error.rb'
require_relative './usuario_inexistente_error.rb'
require_relative './login_error.rb'


class Cuenta
	attr_accessor :estado
	attr_reader :usuarios
	attr_accessor :autenticador
	
	def initialize
		self.estado = Deslogueado.new
		texto_plano
		@usuarios = []
	end

	#Creacion de usuarios
	#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
	def usuarios=(usuario)
		#usuario es una instancia de la clase usuario
		@usuarios << usuario
	end

	def usuario_existente?(usuario)
		#chequeo si el usuario ya se encuentra creado, en caso de no estarlo levanto una excepcion
		return usuarios.detect(ifnone = (raise UsuarioInexistenteError.new(usuario))) { |user| user.usuario == usuario }
	end

	def crear_usuario(usuario, password)
		#Chequeo si el usuario esta creado si recibo la excepcion de que no esta creado rescato la aplicacion y creo el nuevo usuario, en caso contrario levanto una nueva excepcion diciendo que el usuario ya se encuentra creado 
		begin
			usuario_existente?(usuario)
		rescue UsuarioInexistenteError => e
			self.usuarios = Usuario.new(usuario, password)
		else
			puts "hola!"
			raise UsuarioExistenteError.new(usuario)
		end
	end

	#Estado del usuario
	#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
	def estado?
		#Le pregunto a mi estado en que estado estoy
		estado.estado?(self)
	end

	#Login de usuarios
	#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
	def login(usuario, password)
		#Chequeo si existe el usuario que me pasan por parametros, en cason de existir el metodo usuario_existente me devuelve el usuario, sino levanta una excepcion que debo manejar
		begin
			user = usuario_existente?(usuario)	
		rescue UsuarioInexistenteError => e
			puts "Nombre de usuario incorrecto"
		else
			#estoy pasando el usuario (no el string) por parametro y voy a tener q modificar los modos de validacion
			if autenticador.valido?(user, password)
				self.usuario = user
				self.estado = Logueado.new
			else
				puts "Password incorrecto"
				raise LoginError
			end
		end

		#metodo valido? manejo excepciones desde el modelo
		#metodo valido2? manejo ls excepciones desde el controlador
		user = usuario_existente?(usuario)
		autenticador.valido2?(user, password)
		self.usuario = user
		self.estado = Logueado.new
		

=begin
		if autenticador.valido?(usuario, password)
			self.estado = Logueado.new
			puts "Usted se ha logueado exitosamente!"
		else
			puts "Nombre de usuario o contraseña incorrecta"
		end
=end
	end

	#Logout usuarios
	#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
	def logout
		estado.logout(self)
	end

		#Autenticador a utilizar
	#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
	def texto_plano
		self.autenticador = Texto_plano.new
	end
	def caesar_cipher
		self.autenticador = Caesar_cipher.new
	end
	def bcrypt
		self.autenticador = Bcrypt.new
	end
end