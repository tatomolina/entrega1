require_relative './estado_cuenta.rb'

class Deslogueado < Estado
	def initialize
		
	end
	def logueado?	
		return false
	end
	def logout(cuenta)
		puts "Usted no se encuentra logueado"
	end
end