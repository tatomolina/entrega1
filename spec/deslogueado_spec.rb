require_relative '../deslogueado.rb'

describe Deslogueado do
	let(:deslogueado) {Deslogueado.new}	
	describe "logueado?" do
		it "Must return false" do
			expect(deslogueado.logueado?).to be false
		end
	end
end