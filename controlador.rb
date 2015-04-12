require_relative './cuenta.rb'

class Controlador 
	attr_accessor :cuenta
	def initialize
		self.cuenta = Cuenta.new
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