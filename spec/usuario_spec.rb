require_relative '../usuario.rb'

describe Usuario do
	let(:usuario) {Usuario.new("admin", "admin")}

	describe "initialize" do
		it "Al instanciar debria contener el nombre del usuario" do
			expect(usuario.nombre_usuario).to eq("admin") 
		end
	end

	describe "caesar_cipher" do
			before {usuario.caesar_cipher}
		it "Debe cambiar el autenticador a Caesar_cipher" do
			expect(usuario.autenticador).to be_instance_of(Caesar_cipher)
		end
	end

	describe "texto_plano" do
			before {usuario.texto_plano}
		it "Debe cambiar el autenticador a Texto plano" do
			expect(usuario.autenticador).to be_instance_of(Texto_plano)
		end
	end

	describe "bcrypt" do
		before {usuario.bcrypt}
		it "Debe cambiar el autenticador a Bcrypt" do
			expect(usuario.autenticador).to be_instance_of(Bcrypt)
		end
	end
end