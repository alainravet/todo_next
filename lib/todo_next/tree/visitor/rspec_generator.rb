require File.dirname(__FILE__) + '/base'

module TodoNext
  class Tree
    module Visitor
      class RspecGenerator < Base

        def process_terminal_node(curr_node, level, parent)
          tabs  = '  '*(level-1)
          label = label(curr_node)
          code = %Q|#{tabs}it("#{label}", :pending => "#{label}"){}|
        end

        def process_non_terminal_node(curr_node, level, parent)
          tabs = '  '*(level-1)
          codes = curr_node.children.collect { |node| visit(node, 1+level, parent=self) }
          [%Q|#{tabs}describe "#{label(curr_node)}" do|] + codes + ["#{tabs}end"]
        end

        def label(node)
          text = node.text
          text.gsub! /^[-\+]\s*/,''
          text
        end

      end
    end
  end
end
