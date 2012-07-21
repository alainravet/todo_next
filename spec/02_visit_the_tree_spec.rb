require 'spec_helper'


describe TodoNext::Tree, 'visiting the tree depth-first' do

  class SimpleVisitor < TodoNext::Tree::Visitor::Base
    def process_terminal_node(curr_node, level, parent)
      curr_node.text
    end

    def process_non_terminal_node(curr_node, level, parent)
      result = curr_node.children.collect { |node| visit(node, 1+level, self) }.join(', ')
      "#{curr_node.text}=[#{result}]"
    end
  end


  it 'visits the tree depth-first' do
    expected = ['HEADER 1=[HEADER 2=[HEADER 3=[spec a, spec b]]]' ,
                'HEADER 4=[spec c]',
                'HEADER 5',
                'HEADER 6'
               ]

    source = 'HEADER 1'            + "\n" +
              '  HEADER 2'          + "\n" +
              '    HEADER 3'        + "\n" +
              '      spec a'        + "\n" +
              '      spec b'        + "\n" +
              'HEADER 4'            + "\n" +
              '  spec c'            + "\n" +
              'HEADER 5'            + "\n" +
              'HEADER 6'

    TodoNext::Parser.
        parse(source).
        visit(SimpleVisitor.new).
        should == expected
  end
end