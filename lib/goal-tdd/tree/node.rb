module GoalTDD

  class Tree
    class Node
      attr_accessor :text, :parent, :children
      def initialize(text, parent=nil)
        @text, @parent = text, parent
        @children = []
      end
    end

    class OL < Node ; end
    class LI < Node ; end
  end

end