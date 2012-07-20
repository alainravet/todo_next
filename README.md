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
$ cd <project-spec>
$ todo_next your_spec.rb
    # => spec/your_spec.rb was created.
$ cat spec/your_spec.rb
    # =>
```
```ruby
    require 'todo_next/rspec'

    goal do
        Describing your project goals in plain English is easy.
        It's an easy way to collect your ideas before starting coding.
        The text below will turn into 4 pending specs in 2 describe blocks.
        # does not start in column 0 => ignored (comments)

    Your code   #starts in column 0 => converted (specs)
      - does this
      - does that
      Optionally it could
        - do this
        - do that
          example:
              this is just a comment block (starts with 'example:')
              foo bar
              buz

    end
```
This text is equivalent to :

```ruby
    require 'todo_next/rspec'

    describe 'Project goals:' do
      describe 'Your code' do
        it 'does this'
        it 'does that'
        describe 'Optionally it could' do
          it 'do this'
          it 'do that'
        end
      end
    end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
