require 'byebug'

class PolyTreeNode
  # attr_reader :value, :parent, :children
  # attr_accessor :parent, :children
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent
    @parent
  end

  def parent=(node)
    # debugger
    unless @parent.nil?

      @parent.children.delete(self)
    end


    @parent = node
    unless @parent.nil?
      unless @parent.children.include?(self)
        @parent.children << self
      end
    end

    
    # debugger
  end

  def children
    @children
  end

  def value
    @value
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    child_node.parent= nil
    raise "not a child" if child_node.parent == nil
  end

  def dfs(target_value)
    
    if self.value == target_value
      return self
    end

    self.children.each do |child|
      x = child.dfs(target_value)
      return x if x
    end

    nil
  end

  def bfs(target_value)
    # debugger
    queue = []
    queue << self
    until queue.empty?
      node = queue.shift
      if node.value == target_value
        return node
      end
      queue.concat(node.children)
    end
    nil
  end

  # def inspect
  #   # @children.inspect
  # end
  

end