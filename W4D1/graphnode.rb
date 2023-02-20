require 'set'

class GraphNode
  attr_accessor :value, :neighbors
  
  def initialize(value)
    @value = value
    @neighbors = []
  end

end


  def bfs(starting_node, target_value)
    visited = Set.new
    nodes_queue = [self.value]

    until nodes_queue.empty?
      node = node_queue.shift
      unless visited.include?(node)
        return node.val if node.val == target_value
        visitied.add(node)
        nodes_queue += node.neighbors
      end
    end

    return nil
  end

if $PROGRAM_NAME == __FILE__
  a = GraphNode.new('a')
  b = GraphNode.new('b')
  c = GraphNode.new('c')
  d = GraphNode.new('d')
  e = GraphNode.new('e')
  f = GraphNode.new('f')
  a.neighbors = [b, c, e]
  c.neighbors = [b, d]
  e.neighbors = [a]
  f.neighbors = [e]
end