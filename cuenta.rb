require_relative './logueado.rb'
require_relative './deslogueado.rb'
require_relative './texto_plano.rb'
require_relative './caesar_cipher.rb'
require_relative './bcrypt.rb'
require_relative './usuario_existente_error.rb'
require_relative './usuario.rb'

class Cuenta
	attr_accessor :estado
	attr_reader :usuarios
	attr_accessor :autenticador
	
	def initialize
		self.estado = Deslogueado.new
		texto_plano
		@usuarios = []
	end

	#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
	def usuarios=(usuario)
		#usuario es una instancia de la clase usuario
		@usuarios << usuario
	end
	def usuario_existente?(usuario)
		#chequeo si el usuario ya se encuentra creado
		if usuarios.detect { |user| user.usuario == usuario }
			raise UsuarioExistenteError.new(usuario)
		end
	end
	def crear_usuario(usuario, password)
		#Creo un usuario y lo guardo en el array usuarios
		self.usuarios = Usuario.new(usuario, password)
	end
	def estado?
		#Le pregunto a mi estado en que estado estoy
		estado.estado?(self)
	end
	def login(usuario, password)
		if autenticador.valido?(usuario, password)
			self.estado = Logueado.new
			puts "Usted se ha logueado exitosamente!"
		else
			puts "Nombre de usuario o contraseña incorrecta"
		end
	end
	def logout
		estado.logout(self)
	end
	
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