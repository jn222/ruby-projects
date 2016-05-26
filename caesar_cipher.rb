def caesar_cipher(s, offset)
	output = ""
  	s.each_char do |char|
    	if ('A'..'Z') === char
      		char = shift(char, offset, 'A')
    	elsif ('a'..'z') === char
    		char = shift(char, offset, 'a')
    	end
    	output << char
  	end
  	puts(output)
end

def shift(char, offset, base)
	((char.ord + offset - base.ord)%26 + base.ord).chr
end

caesar_cipher("Helloooo Good Morning!!", 27)