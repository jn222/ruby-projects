def substrings(str, dict)
	subs = Hash.new(0)
	str.downcase.split(/[^\w']+/).each do |word|
		dict.each do |substring|
			subs[substring] += 1 if word[substring]
		end
	end
	puts subs.inspect
end

dictionary = ["all","heel", "pat"]
substrings("patt heel all dfdf all",dictionary)