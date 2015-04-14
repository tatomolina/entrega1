require_relative '../cuenta.rb'

describe Cuenta do
	before(:each) do
		@cuenta = Cuenta.new
		@cuenta.crear_usuario("admin", "admin")
	end
	describe "usuario_existente?(string)" do
		it "Deberia devolver false si el usuario no existe" do
			expect{@cuenta.usuario_existente?("Pepe")}.to be false
		end
	end
end