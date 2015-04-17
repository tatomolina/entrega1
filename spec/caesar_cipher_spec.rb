require_relative '../caesar_cipher.rb'
require_relative '../usuario.rb'

describe Caesar_cipher do
	let(:caesar) {Caesar_cipher.new}
	let(:password) {CaesarCipher::Caesar.new.cipher("admin")}
	
	describe "valido?(string)" do
		it "Devuelve true cuando el password es correcto" do
			expect(caesar.valido?(password, "admin")).to be true
		end
		
		it "Devuelve false cuando el password es incorrecto" do
			expect(caesar.valido?(password, "a")).to be false
		end
	end

	describe "password_caesar" do
		it "Debe devolver la misma password" do
			expect(caesar.password_caesar(password)).to be(password)
		end
	end

	describe "password_plano" do
		it "Debe devolver el password en texto plano" do
			expect(caesar.password_plano(password)).to eq("admin")
		end
	end

	describe "password_bcrypt" do
		it "Debe devolver el password en formato de hash" do
			expect(caesar.password_bcrypt(password)).to eq("admin")
		end
	end
end