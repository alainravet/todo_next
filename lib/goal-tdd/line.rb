module GoalTDD

  class Line
    attr_accessor :text, :col_offset, :leaf

    def initialize(text, col_offset)
      @text, @col_offset = text, col_offset
    end

    def to_s
      "<Line# text:#{text}, leaf:#{leaf}, col_offset:#{col_offset}>"
    end

    def blank?
      text =~ /^\s*$/
    end
    def comment?
      text =~ /^#/
    end

    def leaf?   ; leaf   end
    def branch? ; !leaf? end
  end

end