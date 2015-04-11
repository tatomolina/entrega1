require_relative './estado_cuenta.rb'

class Logueado < Estado
	def initialize
		
	end
	def estado?(cuenta)
		puts "Usted esta logueado como #{cuenta.usuario}"
	end
	def logout(cuenta)
		cuenta.estado = Deslogueado.new
		puts "Usted se ha deslogueado en forma exitosa"
	end
end