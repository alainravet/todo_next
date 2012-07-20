require File.dirname(__FILE__) + '/todo_next/version'

module TodoNext
  # Your code goes here...
end
require File.dirname(__FILE__) + '/todo_next/parser'

main = TOPLEVEL_BINDING.eval('self')
def main.todo_next(text, puts_code=false)
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