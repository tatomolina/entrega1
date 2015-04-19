require_relative './logueado.rb'
require_relative './deslogueado.rb'
require_relative './texto_plano.rb'
require_relative './caesar_cipher.rb'
require_relative './bcrypt.rb'
require_relative './usuario.rb'
require_relative './usuario_existente_error.rb'
require_relative './usuario_inexistente_error.rb'
require_relative './usuario_no_logueado.rb'
require_relative './login_error.rb'


class Cuenta
	attr_accessor :estado
	attr_accessor :usuario
	attr_reader :usuarios
	
	def initialize
		self.estado = Deslogueado.new
		@usuarios = []
		crear_usuario("admin", "admin")
	end

	#Creacion de usuarios
	#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
	def usuarios=(usuario)
		#usuario es una instancia de la clase usuario
		@usuarios << usuario
	end

	def usuario_existente?(nombre_usuario)
		#chequeo si el usuario ya se encuentra creado
		return usuarios.any? { |user| user.nombre_usuario == nombre_usuario }
	end

	def dame_usuario(nombre_usuario)
		return usuarios.detect {|user| user.nombre_usuario == nombre_usuario}
	end

	def crear_usuario(nombre_usuario, password)
		#Chequeo si el usuario esta creado, en caso de estarlo levanto una excepcion, en el caso contrario creo el usuario  
		if usuario_existente?(nombre_usuario)
			raise UsuarioExistenteError.new(nombre_usuario)
		else
			self.usuarios = Usuario.new(nombre_usuario, password)
		end
	end

	#Estado del usuario
	#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
	def usuario_logueado
		#Le pregunto a mi estado el usuario logueado
		if estado.logueado?
			return usuario.nombre_usuario
		else
			raise UsuarioNoLogueado
		end
	end

	#Login de usuarios
	#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
	def login(nombre_usuario, password)
		#Chequeo si existe el usuario que me pasan por parametros, en cason de existir el metodo usuario_existente me devuelve el usuario, sino levanta una excepcion que debo manejar
		if usuario_existente? nombre_usuario
			self.usuario = dame_usuario nombre_usuario
			if usuario.password_correcto? password
				self.estado = Logueado.new
			else
				self.usuario = nil
				raise LoginError 
			end
		else
			raise UsuarioInexistenteError
		end
	end

	#Logout usuarios
	#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
	def logout
		self.estado = Deslogueado.new
		self.usuario = nil
	end

	#Indico con que Autenticador voy a trabajar
	#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
	def texto_plano
		usuario.texto_plano	
	end	

	def caesar_cipher
		usuario.caesar_cipher
	end

	def bcrypt
		usuario.bcrypt
	end

	def restablecer_password
		usuario.restablecer_password
	end
end