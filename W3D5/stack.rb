class Stack
	def initialize
		@stack = Array.new
	end

	def push(el)
		@stack << el
		self
	end

	def[](pos)
		@stack[pos]
	end

	def pop
		@stack.pop
	end

	def peek
		self[-1]
	end

	private
	attr_reader :store

end

if $PROGRAM_NAME == __FILE__
	stack = Stack.new
	p stack.push(4)
	p stack.push(5)
	p stack.push(10)
	p stack.pop
	p stack.peek
	p stack
end