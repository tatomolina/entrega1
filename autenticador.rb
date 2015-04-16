class Autenticador
	def initialize()
		
	end
	
	def valido?(usuario, password)
		raise NotImplementedError
	end

	def password_plano(usuario)
		raise NotImplementedError
	end

	def password_caesar(usuario)
		raise NotImplementedError
	end

	def password_bcrypt(usuario)
		raise NotImplementedError
	end
end