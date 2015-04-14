require_relative './logueado.rb'
require_relative './deslogueado.rb'
require_relative './texto_plano.rb'
require_relative './caesar_cipher.rb'
require_relative './bcrypt.rb'
require_relative './usuario.rb'
require_relative './usuarioExistenteError'

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
		#chequeo si el usuario ya se encuentra creado
		return usuarios.detect(ifnone = false) { |user| user.usuario == usuario }
	end

	def puedo_crear_usuario?(usuario)
		#Evaluo si ya existe un usuario. En caso de existir levanto una excepcion, en caso contrario devuelvo true
		if usuario_existente(usuario)
			raise UsuarioExistenteError.new(usuario)
		else 
			return true
		end
	end

	def crear_usuario(usuario, password)
		#Creo un usuario y lo guardo en el array usuarios
		puedo_crear_usuario(usuario)
	end

	def estado?
		#Le pregunto a mi estado en que estado estoy
		estado.estado?(self)
	end

	#Login de usuarios
	#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
	def login(usuario, password)
		usuario_existente?(usuario)

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