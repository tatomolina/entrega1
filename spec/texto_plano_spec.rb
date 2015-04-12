require_relative '../texto_plano.rb'

describe Texto_plano do
	before(:each) do
		@texto_plano = Texto_plano.new
	end
	describe "valido?(string)" do
		it "Devuelve true cuando el usuario y el password son correctas" do
			expect(@texto_plano.valido?("admin", "admin")).to be true
		end
		it "Devuelve false cuando el usuario es incorrecto" do
			expect(@texto_plano.valido?("a", "admin")).to be false
		end

		it "Devuelve false cuando el password es incorrecto" do
			expect(@texto_plano.valido?("admin", "a")).to be false
		end
	end
end