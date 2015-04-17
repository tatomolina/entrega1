require_relative './autenticador.rb'
require 'caesar_cipher'
require 'bcrypt'

class Caesar_cipher < Autenticador
	attr_accessor :caesar
	def initialize

	end
	def valido?(user_password, password)
		return password_plano(user_password) == password
	end

	def password_plano(password)
		return CaesarCipher::Caesar.new.decipher(password)
	end

	def password_caesar(password)
		return password
	end

	def password_bcrypt(password)
		return BCrypt::Password.create(password_plano password)
	end
end