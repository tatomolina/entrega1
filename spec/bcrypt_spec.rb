require_relative '../bcrypt.rb'
require_relative '../usuario.rb'
require 'bcrypt'

describe Bcrypt do
	let(:bcrypt) {Bcrypt.new}
	let(:password) {BCrypt::Password.create("admin")}
	describe "valido?(password, password_pretendiente)" do
		it "Devuelve true cuando el password es correcto" do
			expect(bcrypt.valido?(password, "admin")).to be true
		end
		
		it "Devuelve false cuando el password es incorrecto" do
			expect(bcrypt.valido?(password, "a")).to be false
		end
	end

	describe "password_caesar" do
		it "Debe levantar la excepcion ConversionIrrealizableError" do
			expect{bcrypt.password_caesar(password)}.to raise_error ConversionIrrealizableError
		end
	end

	describe "password_plano" do
		it "Debe levantar la excepcion ConversionIrrealizableError" do
			expect {bcrypt.password_plano(password)}.to raise_error ConversionIrrealizableError
		end
	end

	describe "password_bcrypt" do
		it "Debe devolver la misma password" do
			expect(bcrypt.password_bcrypt(password)).to be(password)
		end
	end
end