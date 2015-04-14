require 'caesar_cipher'
require 'bcrypt'

class Usuario
	attr_accessor :usuario
	attr_accessor :password_plano
	attr_reader :password_caesar
	attr_reader :password_bcrypt

	def initialize(usuario, password)
		self.usuario = usuario
		self.password_plano = password
		self.password_caesar = password
		self.password_bcrypt = password
	end
	def password_caesar=(password)
		@password_caesar = CaesarCipher::Caesar.new.cipher(password)
	end
	def password_bcrypt=(password)
		@password_bcrypt = BCrypt::Password.create(password)
	end
end