class UsuarioExistenteError < StandardError
	attr_accessor :usuario
	def initialize(usuario)
		self.usuario = usuario		
	end
end