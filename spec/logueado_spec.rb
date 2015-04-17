require_relative '../logueado.rb'

describe Logueado do
	let(:logueado) {Logueado.new}	
	describe "logueado?" do
		it "Must return true" do
			expect(logueado.logueado?).to be true
		end
	end
end