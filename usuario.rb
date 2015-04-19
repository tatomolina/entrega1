require_relative './texto_plano.rb'
require_relative './caesar_cipher.rb'
require_relative './bcrypt.rb'

class Usuario
	attr_accessor :nombre_usuario
	attr_accessor :autenticador

	def initialize(nombre_usuario, password)
		self.nombre_usuario = nombre_usuario
		@password = password
		self.autenticador = Texto_plano.new
	end

	def password_correcto?(password_pretendiente)
		autenticador.valido?(@password, password_pretendiente)
	end

#Autenticador
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
	def texto_plano
		@password = self.autenticador.password_plano(@password)
		self.autenticador = Texto_plano.new
	end

	def caesar_cipher
		@password = self.autenticador.password_caesar(@password)
		self.autenticador = Caesar_cipher.new 	
	end 

	def bcrypt
		@password = self.autenticador.password_bcrypt(@password)
		self.autenticador = Bcrypt.new
	end
	
	def restablecer_password
		@password = "1234"
		self.autenticador = Texto_plano.new
	end
end