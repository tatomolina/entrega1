require 'highline/import'
require_relative './controlador.rb'
require_relative './vista.rb'

Vista.new
#controlador = Controlador.new
=begin
	
salir = false;
while !salir do

	choose do |menu|
		menu.header = "Menu"
		menu.prompt = "Elija una opcion: "
		menu.choice(:Login) do
			usuario = ask "Usuario: "
			password = ask("Password: ") {|password| password.echo = "*"}
			controlador.login(usuario, password)	
		end
		menu.choice(:Logout) do
			controlador.logout
		end
		menu.choice(:Estado) do
			controlador.estado?
		end
		menu.choice(:"Autenticador (default es texto_plano)") do
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
		end
		menu.choice(:Salir) do
			say "Adios, vuelva pronto!"
			salir = true		
		end
	end
end

=end