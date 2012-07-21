require File.dirname(__FILE__) + '/todo_next/version'

module TodoNext
  # Your code goes here...
end
require File.dirname(__FILE__) + '/todo_next/parser'

main = TOPLEVEL_BINDING.eval('self')
def main.todo_next(text, puts_code=true)
  code = TodoNext(text)
  if puts_code
    puts '---' ; puts code  ; puts '---'
  end
  eval code
end

def TodoNext(source)
  tree = TodoNext::Parser.parse(source)
  tree.prune_examples
  tree.to_rspec
end