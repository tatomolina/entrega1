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
		rescue UsuarioExistenteError => e
			puts "#{e.usuario} ya se encuentra registrado"
		end		
		vista.login
	end

	#Login de usuarios
	#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
	def login(usuario, password)
		begin
			cuenta.login(usuario, password)
		rescue LoginError
			vista.login
		else
			vista.logout
		end
	end

	#Logout de usuarios
	#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
	def logout
		cuenta.logout
	end

	#Consulto el estado
	#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
	def estado?
		cuenta.estado?
	end

	#Autenticador a usar
	#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
	def texto_plano
		cuenta.texto_plano		
	end

	def caesar_cipher
		cuenta.caesar_cipher
	end

	def bcrypt
		cuenta.bcrypt
	end
end
