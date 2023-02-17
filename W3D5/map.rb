class Map
  
  def initialize
    @map = Array.new {Array.new(2)}
  end

  def set(key, value)
    if @map.assoc(key) == nil
      @map << [key,value]
    else
      @map.assoc(key).replace([key,value])
    end
  end

  def get(key)
    @map.assoc(key)
  end

  def delete(key)
    (0...@map.length).each do |i|
      if @map[i][0] == key
        @map.delete_at(i)
      end
    end
  end

  def show
    @map
  end

end 

if $PROGRAM_NAME == __FILE__
  p map = Map.new
  map.set("jack",4)
  map.set("queen",3)
  map.set("king",3)
  map.set("king",5)
  p map
  p map.delete("king")
  p map
  p map.set(2,3)
  p map.delete(2)
  p map
end