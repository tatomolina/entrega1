require_relative './autenticador.rb'
require 'caesar_cipher'

class Caesar_cipher < Autenticador
	attr_accessor :caesar
	def initialize
		self.caesar = CaesarCipher::Caesar.new
	end
	def valido?(usuario, password)
		return caesar.decipher(usuario.password_caesar) == password
	end
end