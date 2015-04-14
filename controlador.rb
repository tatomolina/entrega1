require_relative './cuenta.rb'
require_relative './vista.rb'

class Controlador 
	attr_accessor :cuenta
	attr_accessor :vista
	def initialize
		self.cuenta = Cuenta.new
		self.vista = Vista.new(self)
	end
	def estado?
		cuenta.estado?
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