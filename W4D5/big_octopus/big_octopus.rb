require 'byebug'

fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 
  'fiiiissshhhhhh']

def sluggish_octopus(array)
  counter = nil

  (0...array.length).each do |i|
    (0...array.length).each do |j|
      if arr[i].length > arr[j].length
        counter = arr[i]
      else
        counter = arr[j]
      end
    end
  end
  counter
end

def dominant_octopus(array)
  element_length = array.map(&:length).sort
  target = element_length.max

  index = bsearch(element_length, target)
  array[index]
end

def bsearch(array, target)
  array = array.sort
  return nil if array.length == 0
  midpoint = array.length / 2
  case array[midpoint] <=> target
  when 0
    midpoint
  when 1
    bsearch(array.take(midpoint), target)
  else
    idx = bsearch(array.drop(midpoint + 1), target)
    idx.nil? ? nil : idx + midpoint + 1
  end
end


def clever_octopus(array)
  counter = array[0]
  array[1..-1].each do |ele|
    counter = ele if ele.length > counter.length
  end
  counter
end

# p sluggish_octopus(fish)
# p dominant_octopus(fish)
# p dominant_octopus(fish)


tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", 
  "left",  "left-up"]
tiles_hash = {}
tiles_array.each_with_index {|ele,i| tiles_hash[ele] = i }

def slow_dance(direction, array)
  array.each_with_index do |ele,i|
    return i if ele == direction
  end
end

def fast_dance(direction, new_tiles_data_structure)
  new_tiles_data_structure[direction]
end

# p slow_dance("up", tiles_array)
# p slow_dance("right-down", tiles_array)
p fast_dance("up", tiles_hash)
p fast_dance("right-down", tiles_hash)