# Rasti::Types

[![Gem Version](https://badge.fury.io/rb/rasti-enum.svg)](https://rubygems.org/gems/rasti-enum)
[![Build Status](https://travis-ci.org/gabynaiman/rasti-enum.svg?branch=master)](https://travis-ci.org/gabynaiman/rasti-enum)
[![Coverage Status](https://coveralls.io/repos/github/gabynaiman/rasti-enum/badge.svg?branch=master)](https://coveralls.io/github/gabynaiman/rasti-enum?branch=master)
[![Code Climate](https://codeclimate.com/github/gabynaiman/rasti-enum.svg)](https://codeclimate.com/github/gabynaiman/rasti-enum)

Type casting

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rasti-enum'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rasti-enum

## Definition

```ruby
module Colors

  extend Rasti::Enum

  module Common
    def red?
      false
    end

    def green?
      false
    end

    def blue?
      false
    end
  end

  class Red < Rasti::Enum::Value
    include Common

    def red?
      true
    end
  end

  class Green < Rasti::Enum::Value
    include Common

    def green?
      true
    end
  end

  class Blue < Rasti::Enum::Value
    include Common

    def blue?
      true
    end
  end

end
```

## Usage

```ruby
Colors.values # => [Colors::Blue.new, Colors::Green.new, Colors::Red.new]

Colors.include?('GREEN') # => true
Colors.include?('WHITE') # => false

Colors['BLUE'].blue? # => true
Colors['BLUE'].red? # => false
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/gabynaiman/rasti-enum.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

