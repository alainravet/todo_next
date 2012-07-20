module GoalTDD

  class Tree
    class ParentsList

      def initialize(parents=nil)
        @parents = parents || { -1 => nil }
      end

      def register_parent(new_parent, options)
        curr_col = options.fetch(:for_col)
        @parents[1+curr_col] = new_parent
        @parents.delete_if{|k, v| k > 1+curr_col }
      end

      def get_for_item_at_column(curr_col)
        parent_key = @parents.keys.sort.reverse.detect {|col| col < curr_col}
        @parents[parent_key]
      end
    end
  end

end