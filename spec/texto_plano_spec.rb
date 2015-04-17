require_relative '../texto_plano.rb'
require_relative '../usuario.rb'

describe Texto_plano do
	let(:texto_plano) {Texto_plano.new}
	let(:password) {"admin"}
	
	describe "valido?(password, password_pretendiente)" do
		it "Devuelve true cuando el password es correcto" do
			expect(texto_plano.valido?(password, "admin")).to be true
		end

		it "Devuelve false cuando el password es incorrecto" do
			expect(texto_plano.valido?(password, "a")).to be false
		end
	end

	describe "password_caesar" do
		it "Debe devolver el password cifrado en caesar" do
			expect(texto_plano.password_caesar(password)).to eq("ehqmr")
		end
	end

	describe "password_plano" do
		it "Debe devolver la misma password" do
			expect(texto_plano.password_plano(password)).to be(password)
		end
	end

	describe "password_bcrypt" do
		it "Debe devolver el password en formato de hash" do
			expect(texto_plano.password_bcrypt(password)).to eq("admin")
		end
	end
end