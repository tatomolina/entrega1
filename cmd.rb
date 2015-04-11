require 'highline/import'

salir = false;
estado = false;

while !salir do

	choose do |menu|
		menu.header = "Menu"
		menu.prompt = "Elija una opcion: "
		menu.choice(:Login) do
			@usuario = ask "Usuario: "
			@password = ask "Password: "
			if @usuario == "admin" && @password == "admin"
				say "Usted se ha logueado exitosamente!"
				estado = true
			else
				say "Nombre de usuario o contraseña incorrecta"
			end	
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
			if estado == false
				say "Usted no se encuentra logueado"
			else
				say "Usted esta logueado como #{@usuario}"
			end
		end
		menu.choice(:Salir) do
			say "Adios, vuelva pronto!"
			salir = true		
		end
	end
end
