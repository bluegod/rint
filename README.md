[![Gem Version](https://badge.fury.io/rb/rint.svg)](https://badge.fury.io/rb/rint) 
[![build status](https://gitlab.com/jameslopez/rint/badges/master/build.svg)](https://gitlab.com/jameslopez/rint/commits/master)
[![coverage report](https://gitlab.com/jameslopez/rint/badges/master/coverage.svg)](https://gitlab.com/jameslopez/rint/commits/master)

# Rint (Ruby Interface)

Rint provides a way to implement behaviour defined by Interface files, warning when the desired behaviour is missing.

### Example:

```ruby
require 'interface'
module Playable
  include Interface

  def initialize
    must_implement :play, play_quietly: 1
  end
end

class Instrument
  implements Playable
end

Instrument.new # will throw: Interface::Error::NotImplementedError: Expected Instrument to implement play for interface Playable
```

As showed in the example above,`must_implement` allows you enforce the implementation of the methods, specifying the arity. When not specified, only the method implementation will be checked.

There is also a CLI to generate the interfaces from the command line:
```sh
$ rint c Playable play play_quietly:1
```
will generate lib/playable.rb (namespaces are also supported).

### Installation

Add it to your Gemfile:

`gem 'rint'`

and run

```sh
$ bundle install
```

### Goals

Duck typing can be evil if not used correctly. While Ruby applications can get a good level of confidence about issues arisen by duck typing, the fear of a method missing exception or constant changes to a class may lead the developer to use safety checks such as respond_to? or raise Errors when a method is missing.

This implementation of rint wraps what other static languages use and encapsulates the safety check in a common place, also making explicit the behaviour through the word "implements" and expecting the developer to guess the behaviour of a class without looking at docs or partially implemented code.

It also provides a centralised way to implement the interface pattern without having the code throwing an error in a hidden method.

### Options

The environment variable DISABLE_RUBY_INTERFACE can be set to 1 in order to globally disable the interfaces - no Error will get thrown. This might be particularly useful in production for performance reasons if we are confident enough through tests that the interfaces are all implemented.

### Contributing

- Fork it

- Create your feature branch (git checkout -b my-new-feature)

- Commit your changes (git commit -am 'Add some feature')

- Push to the branch (git push origin my-new-feature)

- Create new Pull Request

- Enjoy!


License
----

MIT

**Free Software, Hell Yeah!**

Copyright 2015 James Lopez https://github.com/bluegod/rint
