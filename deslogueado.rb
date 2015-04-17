require_relative './estado_cuenta.rb'

class Deslogueado < Estado
	def initialize
		
	end
	def logueado?	
		return false
	end
end