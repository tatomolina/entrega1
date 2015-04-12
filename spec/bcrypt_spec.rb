require_relative '../bcrypt.rb'

describe Bcrypt do
	before(:each) do
		@bcrypt = Bcrypt.new
	end
	describe "valido?(string)" do
		it "Devuelve true cuando el usuario y el password son correctas" do
			expect(@bcrypt.valido?("admin", "admin")).to be true
		end
		it "Devuelve false cuando el usuario es incorrecto" do
			expect(@bcrypt.valido?("a", "admin")).to be false
		end

		it "Devuelve false cuando el password es incorrecto" do
			expect(@bcrypt.valido?("admin", "a")).to be false
		end
	end
end