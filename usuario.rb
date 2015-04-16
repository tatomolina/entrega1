require_relative './texto_plano.rb'
require_relative './caesar_cipher.rb'
require_relative './bcrypt.rb'

class Usuario
	attr_accessor :usuario
	attr_accessor :autenticador

	def initialize(usuario, password)
		self.usuario = usuario
		texto_plano
		@password = password
	end

	def password_correcto?(password)
		autenticador.valido?(@password, password)
	end

#Autenticador
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
	def Texto_plano
		@password = self.autenticador.password_plano(@password)
		self.autenticador = Texto_plano.new
	end

	def caesar
		@password = self.autenticador.password_caesar(@password)
		self.autenticador = Caesar_cipher.new 	
	end 

	def bcrypt
		@password = self.autenticador.password_bcrypt(@password)
		self.autenticador = Bcrypt.new
	end
end