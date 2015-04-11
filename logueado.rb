require_relative './estado_cuenta.rb'

class Logueado < Estado
	def initialize
		
	end
	def estado?(cuenta)
		puts "Usted esta logueado como #{cuenta.usuario}"
	end
end