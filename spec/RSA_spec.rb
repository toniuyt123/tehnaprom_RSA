require_relative '../lib/RSA.rb'

RSpec.describe RSA do
	
	rsa = RSA.new(2231, 181, 1021)

	it "cheacks if return n works" do
		expect(rsa.n).to eq(2231)
	end

	it "cheacks if return e works" do
		expect(rsa.e).to eq(181)
	end
		
	it "cheacks if return d works" do
		expect(rsa.d).to eq(1021)
	end
end
