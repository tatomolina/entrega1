require_relative './autenticador.rb'

class Texto_plano < Autenticador
	def initialize
		
	end
	def valido?(usuario, password)
		return usuario.password_plano == password
	end
end