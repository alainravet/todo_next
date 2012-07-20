require File.dirname(__FILE__) + '/tree/factory'

module GoalTDD

  class Tree
    attr_accessor :children

    def initialize
      @children = []
    end

  end

end