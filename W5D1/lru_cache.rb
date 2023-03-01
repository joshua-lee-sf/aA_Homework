

class LRUCache
  def initialize(max_size)
    @underlying_array = []
    @max_size = max_size
  end

  def count
    @underlying_array.size
    # returns number of elements currently in cache
  end

  def add(el)
    # adds element to cache according to LRU principle
    # if the size is not at the max_size, add the element into the list
    # if the cache is at the max_size, delete the oldest item and add the newest item in.
    # if the item is already in the cache, delete that item and add it back into the list
    if self.count == @max_size && !@underlying_array.include?(el)
      @underlying_array.shift
      @underlying_array << el
    elsif self.count == @max_size || @underlying_array.include?(el)
      @underlying_array.delete(el)
      @underlying_array << el
    else
      @underlying_array << el
    end
    # if @underlying_array.include?(el)
    #   @underlying_array.delete(el)
    #   @underlying_array << el
    # elsif count >= @max_size
    #   @underlying_array.shift
    #   @underlying_array << el
    # else
    #   @underlying_array << el
    # end
  end

  def show
    print @underlying_array
    # shows the items in the cache, with the LRU item first
  end

  private
  # helper methods go here!

end

johnny_cache = LRUCache.new(4)

p johnny_cache.add("I walk the line") #["I walk the line"]
p johnny_cache.add(5) #["I walk the line", 5]

johnny_cache.count # => returns 2

p johnny_cache.add([1,2,3]) #["I walk the line", 5, [1,2,3]]
p johnny_cache.add(5) #["I walk the line", [1,2,3], 5]
p johnny_cache.add(-5) #["I walk the line", [1,2,3], 5, -5]
p johnny_cache.add({a: 1, b: 2, c: 3})  #[[1,2,3], 5, -5, {a: 1, b: 2, c: 3}]
p johnny_cache.add([1,2,3,4]) #[5, -5, {a: 1, b: 2, c: 3}, [1,2,3,4]]
p johnny_cache.add("I walk the line") #[ -5, {a: 1, b: 2, c: 3}, [1,2,3,4], "I walk the line"]
p johnny_cache.add(:ring_of_fire)  #[{a: 1, b: 2, c: 3}, [1,2,3,4], "I walk the line", :ring_of_fire]
p johnny_cache.add("I walk the line") #[{a: 1, b: 2, c: 3}, [1,2,3,4], :ring_of_fire, "I walk the line"]
johnny_cache.add({a: 1, b: 2, c: 3}) #[[1,2,3,4], :ring_of_fire, "I walk the line", {a: 1, b: 2, c: 3}]

johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]