require 'prime'

class RSA
	def initialize n, e, d
		@n = n
		@e = e
		@d = d
	end

	def n
		return @n
	end

	def e
		return @e
	end

	def d
		return @d
   	end

	def new_key
		keys = Array.new
		range = 40
		p = rand(range)
		q = rand(range)
		while !Prime.prime?(p)
			p = rand(range)
		end		
		while !Prime.prime?(q)
			q = rand(range)
		end

		n = p * q
		keys[0] = n
		lcm = (p - 1).lcm(q - 1)

		e = rand(lcm)
		while e.gcd(lcm) != 1
			e = rand(lcm)
		end
		keys[1] = e

		d = 1
		while ((d * e)%lcm != 1)
			d = d + 1
		end
		keys[2] = d			

		p n,e,d

		return keys
	end

	def encrypt message
		crypt = Array.new
		index = 0
		message.each_byte do |c|
			c = (c.ord ** @e) % @n
			crypt[index] = c
			index = index + 1
		end

		return crypt
	end

	def decrypt message
	 	message.each do |c|
			c = ( c.ord ** @d) % @n
			p c
		end
	end 
end

r = RSA.new(187, 17, 33)
r.new_key
p "Encrypt"
msg = r.encrypt("!")
p "Decrypt"
r.decrypt(msg)

