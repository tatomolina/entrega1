require_relative '../usuario.rb'

describe Usuario do
	before(:each) do
		@usuario = Usuario.new("admin", "admin")
	end
	describe "initialize" do
		it "Al instanciar debria contener el nombre del usuario" do
			expect(@usuario.usuario).to eq("admin") 
		end
		
		it "Al instanciar deberia contener el password plano" do
			expect(@usuario.password_plano).to eq("admin")
		end

		it "Al instanciar deberia contener el password cifrado en caesar" do
			expect(@usuario.password_caesar).to eq("ehqmr")
		end
		it "Al instanciar deberia contener el password cifrado en bcrypt" do
			expect(@usuario.password_bcrypt).to eq("admin")
		end		
	end
end