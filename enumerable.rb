module Enumerable
	def my_each
		for i in 0...self.length
			yield(self[i]) if block_given?
		end
		self
	end

	def my_each_with_index
		for i in 0...self.length
			yield(self[i], i) if block_given?
		end
		self
	end

	def my_select
		selected = []
		return self unless block_given?
		for i in 0...self.length
			selected << self[i] if yield(self[i])
		end
		self
	end

	def my_all?
		if block_given?
			for i in 0...self.length
				return false unless yield(self[i])
			end
		end
		true
	end

	def my_any?
		if block_given?
			for i in 0...self.length
				return true if yield(self[i])
			end
			return false
		end
		return true if self != nil
		false
	end

	def my_none?
		if block_given?
			for i in self
				return false if yield(i)
			end
			return true
		end
		for i in self
			return false if i
		end
		true
	end

	def my_count(arg=nil)
		count = 0
		for i in self
			if block_given?
				count += 1 if yield(i)
			elsif arg
				count += 1 if i == arg
			else
				return self.length
			end
		end
		count
	end

	def my_map(&proc)
		map = []
		for i in self
			if proc
				map << proc.call(i)
			elsif block_given?
				map << yield(i)
			end
		end
		map
	end

	def my_inject(init=0)
		for i in self
			init = yield(init, i)
		end
		init
	end	
end

def multiply_els(arr)
	arr.my_inject(1){|init,i| init*i }
end

puts multiply_els([1,2,3])

