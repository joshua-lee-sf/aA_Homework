class Stack
	def initialize
		@stack = Array.new
	end

	def push(el)
		@stack << el
	end

	def pop
		popped = @stack.pop
	end

	def peek
		@stack[-1]
	end

end