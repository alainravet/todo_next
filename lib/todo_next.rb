require "todo_next/version"

module TodoNext
  # Your code goes here...
end
require File.dirname(__FILE__) + '/todo_next/parser'
require File.dirname(__FILE__) + '/todo_next/tree/depth_first_visitor_base'

require File.dirname(__FILE__) + '/todo_next/rspec_generator_visitor'

main = TOPLEVEL_BINDING.eval('self')
def main.todo_next(text, puts_code=true)
  code = TodoNext(text)
  if puts_code
    puts '---' ; puts code  ; puts '---'
  end
  eval code
end

def TodoNext(source)
  TodoNext::Parser.
      parse(source).
      visit(TodoNext::RspecGeneratorVisitor.new).
      flatten.
      join("\n")
end