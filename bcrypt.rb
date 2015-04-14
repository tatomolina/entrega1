require_relative './autenticador.rb'
require 'bcrypt'

class Bcrypt < Autenticador
	def initialize
		
	end
	def valido?(usuario, password)
		return usuario.password_bcrypt == password
	end
end