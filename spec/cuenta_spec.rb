require_relative '../cuenta.rb'

describe Cuenta do
	before(:each) do
		@cuenta = Cuenta.new
		@cuenta.crear_usuario("admin", "admin")
		@admin = @cuenta.usuarios[0]
	end

	describe "crear_usuario" do
		it "debe crear usuario" do
			expect(@cuenta.usuarios).to include(@admin)
		end
		it "Debe levantar una excepcion" do
			expect{@cuenta.crear_usuario("admin", "admin")}.to raise_error
		end
	end

	describe "usuario_existente?(string)" do
		it "Deberia levantar la excepcion UsuarioInexistenteError" do
			expect{@cuenta.usuario_existente?("Pepe")}.to raise_error(UsuarioInexistenteError)
		end
	end
end