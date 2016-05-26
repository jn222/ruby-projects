def stock_picker(prices)
	high=0; low=0; profit = 0
	for i in 0...prices.length
		for j in i...prices.length
			if (prices[j]-prices[i])>profit
				low = i; high = j; profit = prices[j]-prices[i]
			end
		end
	end
	puts("Buying on day #{low+1} and selling on day #{high+1}, you will make $#{profit}")
end

stock_picker([4,3,2,1,4,5,10,7,0])