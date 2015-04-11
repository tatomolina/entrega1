require_relative './logueado.rb'
require_relative './deslogueado.rb'

class Cuenta
	attr_accessor :estado
	attr_accessor :usuario
	attr_accessor :usuario_cableado
	attr_accessor :password_cableada
	def initialize
		self.estado = Deslogueado.new
	end
	def estado?
		estado.estado?(self)
	end
end