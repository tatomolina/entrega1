require_relative './estado_cuenta.rb'

class Deslogueado < Estado
	def initialize
		
	end
	def estado?(cuenta)	
		puts "Usted no se encuentra logueado"
	end
end