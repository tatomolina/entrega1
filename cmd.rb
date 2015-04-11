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
			password = ask "Password: "
			controlador.login(usuario, password)	
		end
		menu.choice(:Logout) do
			if estado == true
				estado = false
				say "Usted se ha deslogueado de forma exitosa"
			else
				say "Usted no se encuentra logueado"
			end
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
