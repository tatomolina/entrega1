require 'highline/import'

choose do |menu|
	menu.header = "Menu"
	menu.prompt = "Elija una opcion: "
	menu.choice(:Login) do
		say "Logueando..."
	end
	menu.choice(:Logout) do
		say "Deslogueando..."
	end
end
