require 'simplecov'
SimpleCov.start
require_relative '../lib/RSA.rb'

RSpec.describe RSA do
	
	msg = "Hello world!"
	rsa = RSA.new(2231, 181, 1021)
	new_keys = rsa.new_key
	rsa_rand = RSA.new(new_keys[0], new_keys[1], new_keys[2])

	context "basic tests" do
		it "checks if return n works" do
			expect(rsa.n).to eq(2231)
		end

		it "checks if return e works" do
			expect(rsa.e).to eq(181)
		end
		
		it "checks if return d works" do
			expect(rsa.d).to eq(1021)
		end
	end
	
	context "crypt/decrypt tests" do
		it "checks if crypt changes message to right numbers" do
			expect(rsa.encrypt("abc")).to eq("388,1359,247")
		end

		it "checks if crypt/decrypt works" do
			expect(rsa.decrypt(rsa.encrypt(msg))).to eq(msg)
		end

		it "checks if crypt/decrypt works with random keys" do
			expect(rsa_rand.decrypt(rsa_rand.encrypt(msg))).to eq(msg)
		end

		it "checks if crypt/decrypt works with random key & longer message" do
			msg = "@#(SD(J!NC(@asdfomg.;51483lo lel {}:\" :))))2412561sdf"	
			expect(rsa_rand.decrypt(rsa_rand.encrypt(msg))).to eq(msg)
		end
	end
end
