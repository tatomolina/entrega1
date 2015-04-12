require_relative './autenticador.rb'
require 'bcrypt'

class Bcrypt < Autenticador
	def initialize
		
	end
	def valido?(usuario, password)
		return usuario == "admin" && BCrypt::Password.create(password) == "admin"
	end
	def hashing(password)
		BCrypt::Password.create(password)
	end
end