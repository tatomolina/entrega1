require_relative './logueado.rb'
require_relative './deslogueado.rb'

class Cuenta
	attr_accessor :estado
	attr_accessor :usuario
	attr_accessor :usuario_cableado
	attr_accessor :password_cableada
	def initialize
		self.estado = Deslogueado.new
		self.usuario_cableado = "admin"
		self.password_cableada = "admin"
	end
	def estado?
		estado.estado?(self)
	end
	def login(usuario, password)
		if usuario_cableado == usuario && password_cableada == password
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