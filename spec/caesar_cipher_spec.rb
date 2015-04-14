require_relative '../caesar_cipher.rb'

describe Caesar_cipher do
	before(:each) do
		@caesar = Caesar_cipher.new
	end
	describe "valido?(string)" do
		it "Devuelve true cuando el usuario y el password son correctas" do
			expect(@caesar.valido?("admin", "admin")).to be true
		end
		it "Devuelve false cuando el usuario es incorrecto" do
			expect(@caesar.valido?("a", "admin")).to be false
		end

		it "Devuelve false cuando el password es incorrecto" do
			expect(@caesar.valido?("admin", "a")).to be false
		end
		it "Devuelve false cuando el password y el usuario son incorrectos" do
			expect(@caesar.valido?("a", "a")).to be false
		end
	end
end