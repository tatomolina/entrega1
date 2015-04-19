require 'highline/import'
require_relative './controlador.rb'
require_relative './cuenta.rb'

class Vista
	attr_accessor :controlador
	attr_accessor :cuenta
	def initialize
		self.cuenta = Cuenta.new
		login
		#(controlador) self.controlador = controlador
	end
	def login
		choose do |menu|
			menu.header = "Login Menu"
			menu.prompt = "Elija una opcion: "
			menu.choice(:"Crear usuario") do
				usuario = ask "Usuario: "
				password = ask("Password: ") {|password| password.echo = "*"}
				begin
					cuenta.crear_usuario(usuario, password)
					mensaje_usuario_creado_exito	
				rescue UsuarioExistenteError
					say "#{usuario} ya se encuentra registrado"
				end		
				login
				#controlador.crear_usuario(usuario, password)
			end
			menu.choice(:Login) do
				usuario = ask "Usuario: "
				password = ask("Password: ") {|password| password.echo = "*"}
				begin
					cuenta.login(usuario, password)
					mensaje_login_exito
					logout
				rescue StandardError
					mensaje_login_error
					login
				end
				#controlador.login(usuario, password)	
			end
			menu.choice(:Estado) do
				begin
					usuario = cuenta.usuario_logueado
					mensaje_estado_loguado(usuario)
					logout
				rescue UsuarioNoLogueado
					mensaje_estado_no_logueado
					login
				end
				#controlador.estado?
			end
			menu.choice(:Salir) do
				say "Adios, vuelva pronto!"
				exit		
			end
		end
	end
	def logout
		choose do |menu|
			menu.header = "Menu"
			menu.prompt = "Elija una opcion: "
				menu.choice(:Logout) do
					cuenta.logout
					mensaje_logout_exito
					login
				#controlador.logout
			end
			menu.choice(:Estado) do
				begin
					usuario = cuenta.usuario_logueado
					mensaje_estado_loguado(usuario)
					logout
				rescue UsuarioNoLogueado
					mensaje_estado_no_logueado
					login
				end
				#controlador.estado?
			end
			menu.choice(:"Autenticador (default es texto_plano)") do	
			autenticador
			end
			menu.choice(:Salir) do
				say "Adios, vuelva pronto!"
				exit		
			end
		end
	end
	
	def autenticador
		choose do |menu|
			menu.prompt = "Elija una opcion: "
			menu.choice(:"Texto plano") do
				begin
					cuenta.texto_plano	
				rescue ConversionIrrealizableError
					mensaje_conversion_error
				end
				#controlador.texto_plano
			end
			menu.choice(:"Caesar cipher") do
				begin
					cuenta.caesar_cipher
				rescue ConversionIrrealizableError
					mensaje_conversion_error
				end
				#controlador.caesar_cipher
			end
			menu.choice(:Bcrypt) do
				cuenta.bcrypt
				#controlador.bcrypt
			end
		end
		logout
	end	

#Definicion de mensajes
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
	def mensaje_logout_exito
		say "Usted se ha deslogueado en forma exitosa"
	end

	def mensaje_estado_loguado(usuario)
		say "Usted esta logueado como #{usuario}"
	end

	def mensaje_estado_no_logueado
		say "Usted no se encuentra logueado"
	end

	def mensaje_login_error
		say "Nombre de usuario o contraseña incorrecta"
	end

	def mensaje_login_exito
		say "Usted se ha logueado exitosamente!"
	end

	def mensaje_conversion_error
		say "No se puede cambiar el metodo de autentifacion"
		say "Para poder utilizar los otros modelos de cifrado, elija la opcion recuperar contraseña y siga los pasos"
		say "Gracias!"
	end

	def mensaje_usuario_creado_exito
		say "Usuario creado correctamente!"
	end
end