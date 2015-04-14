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

	def estado?
		cuenta.estado?
	end

	def usuario_existente?(usuario)
		begin
			cuenta.usuario_existente?(usuario)	
		rescue UsuarioExistenteError => e
			puts "#{e.usuario} ya se encuentra registrado"
			vista.login		
		end
	end

	def crear_usuario(usuario, password)
		usuario_existente?(usuario)
		cuenta.crear_usuario(usuario, password)		
	end

	def login(usuario, password)
		cuenta.login(usuario, password)
	end

	def logout
		cuenta.logout
	end

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
