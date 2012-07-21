# Goal::Tdd

A small DSL that converts free text into pending tests/specs.

## Installation

Add this line to your application's Gemfile:

    gem 'todo_next'

And then execute:

    $ bundle

## Usage

Create a first spec with a todo_next skeleton:

```shell
$ cd <project>
$ todo_next stack
    # => <project>/spec/stack_spec.rb was created.
$ cat spec/stack_spec.rb
    # =>
```
```ruby
    require 'rubygems'
    require 'rspec'
    require 'todo_next'

    todo_next(<<TEXT)
    A Foobar
      - is white by default
      - can be resized
      truthiness()
        - is always true
      (add more tests)
    TEXT


    #describe "<what you're testing>" do
    #  specify 'this should happen' do
    #    .. some code
    #  end
```
This text is equivalent to :

```ruby
    describe "A Foobar" do
      it "- is white by default"
      describe "- can be resized" do
        it "- is always true"
      end
      it "(add more tests)"
    end
```

![screenshot1](https://github.com/alainravet/todo_next/raw/master/doc/screenshot_1.png)
![screenshot1](https://github.com/alainravet/todo_next/raw/master/doc/screenshot_2.png)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
