require_relative './autenticador.rb'

class Texto_plano < Autenticador
	def initialize
		
	end
	def valido?(usuario, password)
		return usuario.password_plano == password
	end

	def valido2?(usuario, password)
		if usuario.password_plano == password
			return true
		else
			raise LoginError
		end
	end
end