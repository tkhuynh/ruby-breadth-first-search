##
# This class represents a tree where each node has an array of children.
class Tree

  ##
  # Reads the key of the tree's root.
  attr_reader :key

  ##
  # Reads or sets the tree's array of children.
  attr_accessor :children

  ##
  # Creates a new tree with the root node key
  # specified by the +key+ param as the @key for the instance.
  def initialize(key)
    @key = key
    @children = []
  end

  ## 
  # Sets the key of the tree's root node, unless +new_key+ is nil.
  # (To remove a node, set the entire node to nil.)
  def key=(new_key)
    if new_key
      @key = new_key
    end
    @key
  end

  ##
  # Searches through all nodes of the tree, moving outward from the root.
  # Looks for first node with key equal to the +target_key+ param.
  # Returns nil if no such node is found.
  def breadth_first_search(target_key)
    queue = [self]
    while queue.any?
      # remove the first node from the queue
      current_node = queue.shift
      # check if the current node's key equals the target key (and return if so)
      if current_node.key == target_key
        return current_node
      end
      # add the current node's children to the queue
      queue += current_node.children
    end

    # if we finish the while loop without returning a node, return nil
    nil
  end

end