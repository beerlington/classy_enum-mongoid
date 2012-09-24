# ClassyEnum::Mongoid

[ClassyEnum](https://github.com/beerlington/classy_enum) is a Ruby on Rails gem that adds class-based enumerator functionality to model attributes. This adaptor works with Mongoid v2.1.0+

## Installation

Add this line to your application's Gemfile:

    gem 'classy_enum-mongoid'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install classy_enum-mongoid

## Usage

See the [ClassyEnum README](https://github.com/beerlington/classy_enum#readme)
for documentation and usage examples.

## Custom fields

You can either use the Enum class as a Custom Mongoid field with serialization support using mongoize/demongoize and evolve support for searches. 

```ruby
class AllowBlankBreedDog
  include Mongoid::Document

  field :breed, type: Breed, :enum => {:allow_blank => true}
end
```

Or you can use the `classy_enum_field` macro to create the enum field in a more shorthand way. 

```ruby
class AllowNilBreedDog
  include Mongoid::Document
  
  classy_enum_field :breed, :allow_nil => true
end
```

Enjoy :)

PS: See the `spec/adapter_spec.rb` file for more details.

## Copyright

Copyright (c) 2012 [Peter Brown](https://github.com/beerlington). See LICENSE for details.
