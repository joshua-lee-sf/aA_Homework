class Map
  attr_accessor :index
  
  def initialize
    @map = Array.new {Array.new(2)}
    @index = 0
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
    @map.delete(key)
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
  map.delete("king")
  p map
end