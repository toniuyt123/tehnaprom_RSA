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
		range = 1000
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

		#p n,e,d

		return keys
	end

	def encrypt message
		return message.chars.map {|c| c.ord ** @e % @n}
	end

	def decrypt message
	 	return (message.map {|c| (c ** @d % @n).chr}).join("")
	end 
end

#r = RSA.new(2231, 181, 1021)
#r.new_key
#puts "Encrypt"
#msg = String.new("abc")
#puts r.encrypt("HEllo")
#puts "Decrypt"
#msg = r.decrypt(secret)
#puts msg
