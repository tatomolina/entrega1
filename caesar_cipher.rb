require_relative './autenticador.rb'
require 'caesar_cipher'

class Caesar_cipher < Autenticador
	def initialize
		caesar = CaesarCipher::Caesar.new
	end
	def valido?(usuario, password)
		
	end
end