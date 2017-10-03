# Wannabe Bool

If **string**, **numeric**, **symbol** and **nil** values wanna be a **boolean** value, they can with the new `to_b` method.
Moreover, you can use `WannabeBool::Attributes` module to create predicate methods in your classes.

[![Gem Version](https://badge.fury.io/rb/wannabe_bool.svg)](http://badge.fury.io/rb/wannabe_bool)
[![Build Status](https://travis-ci.org/prodis/wannabe_bool.svg?branch=master)](https://travis-ci.org/prodis/wannabe_bool)
[![Coverage Status](https://coveralls.io/repos/prodis/wannabe_bool/badge.svg?branch=master&service=github)](https://coveralls.io/github/prodis/wannabe_bool?branch=master)
[![Code Climate](https://codeclimate.com/github/prodis/wannabe_bool/badges/gpa.svg)](https://codeclimate.com/github/prodis/wannabe_bool)
[![Dependency Status](https://gemnasium.com/prodis/wannabe_bool.svg)](https://gemnasium.com/prodis/wannabe_bool)
[![GitHub license](https://img.shields.io/apm/l/vim-mode.svg)](LICENSE)


## Installing

### Gemfile
```ruby
gem 'wannabe_bool'
```

### Direct installation
```
$ gem install wannabe_bool
```

## Using

`to_b` method is available on `String`, `Symbol`, `Numeric`, `TrueClass`, `FalseClass` and `NilClass`.

```ruby
require 'wannabe_bool'
```

### String
* Returns `true` if string is one of these values: **t**, **true**, **on**, **y**, **yes**, **1**.
* Returns `false` if string is one of these values: **f**, **false**, **off**, **n**, **no**, **0**.
* For invalid boolean string representations, returns `false` by default. See "Invalid Value Behaviour" section for more options.

It ignores trailing spaces and letter cases.

```ruby
'1'.to_b    # => true
't'.to_b    # => true
'T'.to_b    # => true
'true'.to_b # => true
'TRUE'.to_b # => true
'on'.to_b   # => true
'ON'.to_b   # => true
'y'.to_b    # => true
'yes'.to_b  # => true
'YES'.to_b  # => true

' 1 '.to_b    # => true
' t '.to_b    # => true
' T '.to_b    # => true
' true '.to_b # => true
' TRUE '.to_b # => true
' on '.to_b   # => true
' ON '.to_b   # => true
' y '.to_b    # => true
'Y'.to_b      # => true
' Y '.to_b    # => true
' yes '.to_b  # => true
' YES '.to_b  # => true

'0'.to_b     # => false
'f'.to_b     # => false
'F'.to_b     # => false
'false'.to_b # => false
'FALSE'.to_b # => false
'off'.to_b   # => false
'OFF'.to_b   # => false
'n'.to_b     # => false
'N'.to_b     # => false
'no'.to_b    # => false
'NO'.to_b    # => false

' 0 '.to_b     # => false
' f '.to_b     # => false
' F '.to_b     # => false
' false '.to_b # => false
' FALSE '.to_b # => false
' off '.to_b   # => false
' OFF '.to_b   # => false
' n '.to_b     # => false
' N '.to_b     # => false
' no '.to_b    # => false
' NO '.to_b    # => false

''.to_b  # => false
' '.to_b # => false
```
#### Invalid Value Behaviour
You can configure the result for invalid boolean string representations, using the `WannabeBool.invalid_value_behaviour` option.

There are 3 predefined behaviours available: to return `false` (default), `nil` or raise an `ArgumentError`:

```ruby
WannabeBool.invalid_value_behaviour = WannabeBool::InvalidValueBehaviour::False
'wherever'.to_b # => false

WannabeBool.invalid_value_behaviour = WannabeBool::InvalidValueBehaviour::Nil
'wherever'.to_b # => nil

WannabeBool.invalid_value_behaviour = WannabeBool::InvalidValueBehaviour::Error
'wherever'.to_b # => ArgumentError: is not a valid boolean representation
```

Moreover you can provide your own behaviour for invalid boolean string representations. Just set a proc or lambda, or even any class or object that responds to `call` method.

```ruby
WannabeBool.invalid_value_behaviour = -> { :prodis }
'wherever'.to_b # => :prodis
```

Note that `WannabeBool.invalid_value_behaviour` is a global configuration, so all results for `to_b` method with invalid boolean string representations will be affected.

### Symbol
Same as `symbol.to_s.to_b`.

```ruby
:'1'.to_b  # => true
:t.to_b    # => true
:true.to_b # => true
:on.to_b   # => true
:y.to_b    # => true
:yes.to_b  # => true

:'0'.to_b   # => false
:f.to_b     # => false
:false.to_b # => false
:off.to_b   # => false
:n.to_b     # => false
:no.to_b    # => false
```

### Numeric
Returns `false` if number is zero. Returns `true` otherwise.

#### Integer
```ruby
0.to_b  # => false
1.to_b  # => true
2.to_b  # => true
-1.to_b # => true
-2.to_b # => true
```

#### Float
```ruby
0.0.to_b  # => false
0.1.to_b  # => true
1.0.to_b  # => true
-0.1.to_b # => true
-1.0.to_b # => true
```

#### BigDecimal
```ruby
require 'bigdecimal'

BigDecimal('0.0').to_b  # => false
BigDecimal('0.1').to_b  # => true
BigDecimal('1.0').to_b  # => true
BigDecimal('-0.1').to_b # => true
BigDecimal('-1.0').to_b # => true
```

### TrueClass
Returns `true`.

```ruby
true.to_b # => true
```

### FalseClass
Returns `false`.

```ruby
false.to_b # => false
```

### NilClass
Returns `false`.

```ruby
nil.to_b # => false
```

## Creating predicate methods

```ruby
class Fake
  include WannabeBool::Attributes

  attr_accessor :name, :main, :published
  attr_wannabe_bool :main, :published
end

fake = Fake.new
fake.main?      # => false
fake.published? # => false

fake.main = true
fake.main? # => true

fake.published = 1
fake.published? # => true

fake.main = 'true'
fake.main? # => true

fake.published = :true
fake.published? # => true
```

## Changelog

[See the changes in each version.](CHANGELOG.md)

## Author
[Fernando Hamasaki de Amorim (prodis)](http://prodis.blog.br)

![Prodis Logo](http://prodis.net.br/images/prodis_150.gif)

## Contributing to wannabe_bool

[See the contributing guide.](CONTRIBUTING.md)

