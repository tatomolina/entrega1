require 'highline/import'

salir = false;

while !salir do

	choose do |menu|
		menu.header = "Menu"
		menu.prompt = "Elija una opcion: "
		menu.choice(:Login) do
			say "Logueando..."
		end
		menu.choice(:Logout) do
			say "Deslogueando..."
		end
		menu.choice(:Estado) do
			say "Tu estado es"
		end
		menu.choice(:Salir) do
			salir = true		
		end
	end
end
