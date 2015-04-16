require_relative './autenticador.rb'
require_relative './conversion_irrealisable_error.rb'
require 'bcrypt'

class Bcrypt < Autenticador
	def initialize
		
	end

	def valido?(user_password, password)
		return user_password == password
	end

	def password_plano(usuario)
		raise ConversionIrrealizableError
	end

	def password_caesar(usuario)
		raise ConversionIrrealizableError
	end

	def password_bcrypt(usuario)
		return usuario.password
	end
end