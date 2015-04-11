require_relative './logueado.rb'
require_relative './deslogueado.rb'
require_relative './texto_plano.rb'

class Cuenta
	attr_accessor :estado
	attr_accessor :usuario
	attr_accessor :autenticador
	def initialize
		self.estado = Deslogueado.new
		self.autenticador = Texto_plano.new
	end
	def estado?
		estado.estado?(self)
	end
	def login(usuario, password)
		if autenticador.valido?(usuario, password)
			self.usuario = usuario
			self.estado = Logueado.new
			puts "Usted se ha logueado exitosamente!"
		else
			puts "Nombre de usuario o contraseña incorrecta"
		end
	end
	def logout
		estado.logout(self)
	end
end