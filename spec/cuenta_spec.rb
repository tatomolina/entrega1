require_relative '../cuenta.rb'

describe Cuenta do
	let(:cuenta) {Cuenta.new}
	let(:admin) {cuenta.usuarios[0]}
	
	describe "crear_usuario" do
		it "debe crear usuario" do
			expect(cuenta.usuarios).to include(admin)
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
end