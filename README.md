# Flatten Ruby Array

# Objective
The objective of this coding assignment is to showcase my design and implementation of production quality code as a member of your development team.

# Design Approach
Made a decision not to override Ruby Array `flatten` method so that during unit testing, I can compare the results from my new method `flatten_it` with it.

Ensure the behavior of `flatten_it` is the same as `Array#flatten` by referring to the [api doc](https://ruby-doc.org/core-2.4.5/Array.html#method-i-flatten).

# Implementation
Below is a few stats of the code base which can be found at: [examples-flatten-array](https://github.com/developertogo/examples-flatten-array)

#### Application LOC
```
$ wc -l flatten_it.rb
    31
```
#### Testing LOC
```
$ wc -l spec/flatten_it_spec.rb
    95
```
#### Test Coverage
There is _100%_ test coverage, see [coverage/index.html](https://github.com/developertogo/examples-flatten-array/blob/master/doc/flatten_array_test_coverage.png) for more details.

# Run Program

#### Prerequisite
    Install ruby and bundle
    Run bundle install


Copy `flatten_it.rb` to your ruby project, and invoke as follows:
```
require 'flatten_it'

[1, 2, [3, 4]].flatten_it

=> [1, 2, 3, 4]
```
**Note**: This code was tested with Ruby 2.4.5

# Unit Tests
Run unit tests as follows:
```
$ rspec flatten_it_spec.rb
```
