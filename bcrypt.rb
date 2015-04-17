require_relative './autenticador.rb'
require_relative './conversion_irrealizable_error.rb'
require 'bcrypt'

class Bcrypt < Autenticador
	def initialize
		
	end

	def valido?(password, password_pretendiente)
		return password == password_pretendiente
	end

	def password_plano(password)
		raise ConversionIrrealizableError
	end

	def password_caesar(password)
		raise ConversionIrrealizableError
	end

	def password_bcrypt(password)
		return password
	end
end