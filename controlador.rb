require_relative './cuenta.rb'
require_relative './vista.rb'

class Controlador 
	attr_accessor :cuenta
	attr_accessor :vista

	def initialize
		self.cuenta = Cuenta.new
		self.vista = Vista.new(self)
		vista.login
	end

	#Creo usuario
	#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
	def crear_usuario(usuario, password)
		#Llamo al emtodo crear_usuario de la clase cuenta, en caso de no poder realizarse esta levanta una excepcion que manejo, en caso contrario crea el usuario.
		begin
			cuenta.crear_usuario(usuario, password)
			vista.mensaje_usuario_creado_exito	
		rescue UsuarioExistenteError => e
			puts "#{usuario} ya se encuentra registrado"
		end		
		vista.login
	end

	#Login de usuarios
	#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
	def login(usuario, password)
		begin
			cuenta.login(usuario, password)
			vista.mensaje_login_exito
			vista.logout
		rescue StandardError
			vista.mensaje_login_error
			vista.login
		end
	end

	#Logout de usuarios
	#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
	def logout
		cuenta.logout
		vista.mensaje_logout_exito
		vista.login
	end

	#Consulto el estado
	#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
	def estado?
		begin
			usuario = cuenta.usuario_logueado
			vista.mensaje_estado_loguado(usuario)
			vista.logout
		rescue UsuarioNoLogueado
			vista.mensaje_estado_no_logueado
			vista.login
		end
	end

	#Autenticador a usar
	#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
	def texto_plano
		begin
			cuenta.texto_plano	
		rescue ConversionIrrealizable => e
			vista.mensaje_conversion_error
		end
		vista.logout
	end

	def caesar_cipher
		begin
			cuenta.caesar_cipher
		rescue ConversionIrrealizableError => e
			vista.mensaje_conversion_error
		end
		vista.logout
	end

	def bcrypt
		cuenta.bcrypt
		vista.logout
	end
end
