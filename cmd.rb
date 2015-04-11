require 'highline/import'
require_relative './controlador.rb'

salir = false;
estado = false;
controlador = Controlador.new

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
		menu.choice(:Salir) do
			say "Adios, vuelva pronto!"
			salir = true		
		end
	end
end
