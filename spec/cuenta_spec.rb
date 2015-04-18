require_relative '../cuenta.rb'

describe Cuenta do
	let(:cuenta) {Cuenta.new}
	let(:admin) {cuenta.usuarios[0]}
	
	describe "crear_usuario" do
		it "debe crear usuario" do
			expect(cuenta.usuarios).to include(admin)
		end
		before {
			cuenta.crear_usuario("pepe", "1234")
		}
		it "Al crear un usuario nuevo debe almacenarlo en el array usuarios" do
			expect(cuenta.usuarios.size).to  be(2)
		end

		it "Debe levantar una excepcion" do
			expect{cuenta.crear_usuario("admin", "admin")}.to raise_error UsuarioExistenteError
		end
	end

	describe "usuario_existente?(string)" do
		it "Devuelve true al existir el usuario" do
			expect(cuenta.usuario_existente?("admin")).to be true
		end

		it "Devuelve false si el usuario no existe" do
			expect(cuenta.usuario_existente?("pepe")).to be false
		end
	end

	describe "dame_usuario(nombre_usuario)" do
		it "Devuelve el usuario pasado por parametros" do
			expect(cuenta.dame_usuario("admin")).to be(admin)
		end
	end

	describe "login(nombre_usuario, password)" do
		before {cuenta.login("admin", "admin")}
		it "Al loguearse asigna el usuario a la cuenta y pone el estado en Logueado" do
			expect(cuenta.usuario).to be(admin)
			expect(cuenta.estado).to be_instance_of(Logueado)
		end
		it "Si el usuario no exite levanta la excepcion UsuarioInexistenteError" do
			expect{cuenta.login("a", "admin")}.to raise_error
		end

		it "Si el password esta mal levanta la excepcion LoginError y deja el usuario mirando a nil" do
			expect{cuenta.login("admin", "a")}.to raise_error LoginError
			expect(cuenta.usuario).to be_nil
		end
	end

	describe "logout" do
			before{cuenta.login("admin", "admin")
				cuenta.logout }
		it "Cambia el estado a logout y el usuario pasa a miarar a nil" do
			expect(cuenta.estado).to be_instance_of Deslogueado
			expect(cuenta.usuario).to be_nil
		end
	end

	describe "usuario_logueado" do
		before{cuenta.login("admin", "admin")}
		it "Devuelve el nombre del usuario logueado" do
			expect(cuenta.usuario_logueado).to eq("admin")
		end
		it "Levanta excepcion UsuarioNoLogueado" do
			expect{cuenta.logout
				cuenta.usuario_logueado}.to raise_error UsuarioNoLogueado
		end
	end
end