require 'highline/import'
require_relative './controlador.rb'

class Vista
	attr_accessor :controlador
	def initialize(controlador)
		self.controlador = controlador
	end
	def login
		choose do |menu|
			menu.header = "Login Menu"
			menu.prompt = "Elija una opcion: "
			menu.choice(:"Crear usuario") do
				usuario = ask "Usuario: "
				password = ask("Password: ") {|password| password.echo = "*"}
				controlador.crear_usuario(usuario, password)
			end
			menu.choice(:Login) do
				usuario = ask "Usuario: "
				password = ask("Password: ") {|password| password.echo = "*"}
				controlador.login(usuario, password)	
			end
			menu.choice(:Estado) do
				controlador.estado?
			end
			menu.choice(:Salir) do
				say "Adios, vuelva pronto!"
				salir = true		
			end
		end
	end
	def logout
		choose do |menu|
			menu.header = "Menu"
			menu.prompt = "Elija una opcion: "
				menu.choice(:Logout) do
				controlador.logout
			end
			menu.choice(:Estado) do
				controlador.estado?
			end
			menu.choice(:"Autenticador (default es texto_plano)") do
				autenticador
			end
			menu.choice(:Salir) do
				say "Adios, vuelva pronto!"
				salir = true		
			end
		end
	end
	
	def autenticador
		choose do |menu|
			menu.prompt = "Elija una opcion: "
			menu.choice(:"Texto plano") do
				controlador.texto_plano
			end
			menu.choice(:"Caesar cipher") do
				controlador.caesar_cipher
			end
			menu.choice(:Bcrypt) do
				controlador.bcrypt
			end
		end
		logout
	end	

	def mensaje_login_error
		puts "Usuario o password incorrecto"
	end
end