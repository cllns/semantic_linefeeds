# Semantic Linefeeds

This is a simple tool to convert text into
[semantic linefeeds](http://rhodesmill.org/brandon/2012/one-sentence-per-line/).

Rather than having formatting paragraphs to fit an arbitrary line-length,
like:
```
First, when you do the purely mechanical operations of typing, type so
subsequent editing will be easy. Start each sentence on a new line. Make lines
short, and break lines at natural places, such as after commas and semicolons,
rather than randomly. Since most people change documents by rewriting phrases
and adding, deleting and rearranging sentences, these precautions simplify any
editing you have to do later.
```

You can add new-lines (er, linefeeds) after each clause and sentence.
```
First,
when you do the purely mechanical operations of typing,
type so subsequent editing will be easy.
Start each sentence on a new line.
Make lines short,
and break lines at natural places,
such as after commas and semicolons,
rather than randomly.
Since most people change documents by rewriting phrases and adding,
deleting and rearranging sentences,
these precautions simplify any editing you have to do later.
```

This makes `diff`ing it show more information.
If you're using Markdown this is terrific,
since your source can be formatted independently
of how you display it.

Take a look at the Source of this `README.md` file
for an example :)

This is just a simple script that breaks lines on certain punctuation marks.
We aim for the output to be good starting point
to convert your text to semantic linefeeds,
rather than attempt to do it automatically 100% correct.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'semantic_linefeeds'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install semantic_linefeeds

## Usage


Once it's installed,
you can run `semantic-linefeeds`.
**NOTE**: this executable uses a hyphen to separate the words,
whereas the git repo and gem use an underscore.

The executable accepts either a string,
or a Filename.

### String example
`semantic-linefeeds Hello, I like this gem. Do you?`

will output:

```
Hello,
I like this gem.
do you?
```

### File name example
````
echo "Hello, I like this gem. Do you?" > tmp.txt`
semantic-linefeeds tmp.txt
```

will output:
```
Hello,
I like this gem.
do you?
```

Note that output currently only goes to STDOUT.

If you try to do something like:
```
semantic-linefeeds README.md > README.md
```
You'll end up with a blank file,
because the `>` clears the `README.md` file (for writing)
before it can be read into memory.

We assume you're using git,
so the code doesn't store of a backup of the original file,
in case of errors.

## TODO:

- [x] Add words to break on ('or, 'and', 'then')
- [ ] Allow user defined words to break on, probably via a YAML config file
- [ ] Allow writing results to a file, rather than only to STDOUT.

## Development

After checking out the repo,
run `bin/setup` to install dependencies.
Then,
run `rake spec` to run the tests.
You can also run `bin/console` for an interactive prompt
that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/cllns/semantic_linefeeds.
This project is intended to be a safe,
welcoming space for collaboration,
and contributors are expected to adhere to the
[Contributor Covenant](contributor-covenant.org)
code of conduct.

## License

The gem is available as open source under the terms of the
[MIT License](http://opensource.org/licenses/MIT).
