require "spec_helper"

RSpec.describe Tree do
  before do
    @my_tree = Tree.new("A")
  end

  describe "Attributes" do
    it "should respond to @key" do
      expect(@my_tree).to respond_to(:key)
    end

    it "should respond to @children" do
      expect(@my_tree).to respond_to(:children)
    end
  end

  describe "Methods" do
    describe "#initialize" do
      it "should set @children to an empty array" do
        expect(@my_tree.children).to be_empty
      end
    end

    describe "#breadth_first_search" do
      before do
        @b_node = Tree.new("B")
        @c_node = Tree.new("C")
        @d_node = Tree.new("D")
        @e_node = Tree.new("E")
        @f_node = Tree.new("F")
        @g_node = Tree.new("G")
        @g_node_closest = Tree.new("G")
        @my_tree.children << [@b_node, @c_node]
        @b_node.children << [@d_node, @e_node, @f_node]
        @c_node.children << @g_node_closest
        @e_node.children << @g_node
        # see bottom of file for diagram of tree structure
      end

      context :found do
        it "should find a direct child node" do
          expect(@my_tree.breadth_first_search("C")).to equal(@c_node)
        end

        it "should find a nested child node" do
          expect(@my_tree.breadth_first_search("E")).to equal(@e_node)
        end

        it "should find the closest matching node if there are duplicate keys" do
          expect(@my_tree.breadth_first_search("G")).to equal(@g_node_closest)
        end
      end

      context :not_found do
        it "should return nil if node is not found" do
          expect(@my_tree.breadth_first_search("H")).to be_nil
        end
      end

    end
  end

end

##
# Represents tree structure for #breadth_first_search spec.
#
#          D
#       /
#     B -- E -- G
#   /   \
# A        F
#   \
#     C -- G