def bubble_sort(arr)
	bubble_sort_by(arr) {|first, second| first - second}
end

def bubble_sort_by(arr)
	swapped = true
	until swapped == false
		swapped = false
		for i in (0...arr.length-1)
			if (yield arr[i],arr[i+1]) > 0
				placeholder = arr[i+1]
				arr[i+1] = arr[i]
				arr[i] = placeholder
				i += 1
				swapped = true
			end
		end
		i -= 1
	end
	puts arr.inspect
end

bubble_sort([4,3,78,2,0,2])

bubble_sort_by(["hi","hello","hey"]) do |left, right|
	left.length - right.length
end
