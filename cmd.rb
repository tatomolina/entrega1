require 'highline/import'

choose do |menu|
	menu.prompt = "Menu"
	menu.choice(:Login) do
		say "Logueando..."
	end
end
