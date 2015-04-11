require_relative './cuenta.rb'

class Controlador 
	attr_accessor :cuenta
	def initialize
		self.cuenta = Cuenta.new
	end
	def estado?
		cuenta.estado?
	end	
end