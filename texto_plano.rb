require_relative './autenticador.rb'
require 'caesar_cipher'
require 'bcrypt'

class Texto_plano < Autenticador
	def initialize
		
	end
	def valido?(user_password, password)
		return user_password == password
	end

	def password_plano(password)
		return password
	end

	def password_caesar(password)
		return CaesarCipher::Caesar.new.cipher(password)
	end

	def password_bcrypt(password)
		return BCrypt::Password.create(password)
	end
end