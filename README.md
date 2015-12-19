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

#### String
Returns `true` if string is one of **t**, **true**, **on**, **y**, **yes** or **1** values. Returns `false` otherwise.

Ignores trailing spaces and letter cases.

```ruby
'1'.to_b        # => true
't'.to_b        # => true
'T'.to_b        # => true
'true'.to_b     # => true
'TRUE'.to_b     # => true
'on'.to_b       # => true
'ON'.to_b       # => true
'y'.to_b        # => true
'yes'.to_b      # => true
'YES'.to_b      # => true

' 1 '.to_b      # => true
' t '.to_b      # => true
' T '.to_b      # => true
' true '.to_b   # => true
' TRUE '.to_b   # => true
' on '.to_b     # => true
' ON '.to_b     # => true
' y '.to_b      # => true
'Y'.to_b        # => true
' Y '.to_b      # => true
' yes '.to_b    # => true
' YES '.to_b    # => true

''.to_b         # => false
'0'.to_b        # => false
'2'.to_b        # => false
'-1'.to_b       # => false
'-2'.to_b       # => false
'f'.to_b        # => false
'F'.to_b        # => false
'false'.to_b    # => false
'FALSE'.to_b    # => false
'off'.to_b      # => false
'OFF'.to_b      # => false
'n'.to_b        # => false
'N'.to_b        # => false
'no'.to_b       # => false
'NO'.to_b       # => false
'not'.to_b      # => false
'NOT'.to_b      # => false
'wherever'.to_b # => false
```

#### Symbol
Same as `symbol.to_s.to_b`.

```ruby
:'1'.to_b      # => true
:t.to_b        # => true
:T.to_b        # => true
:true.to_b     # => true
:TRUE.to_b     # => true
:on.to_b       # => true
:ON.to_b       # => true
:y.to_b        # => true
:Y.to_b        # => true
:yes.to_b      # => true
:YES.to_b      # => true

:f.to_b        # => false
:F.to_b        # => false
:false.to_b    # => false
:FALSE.to_b    # => false
:off.to_b      # => false
:OFF.to_b      # => false
:n.to_b        # => false
:N.to_b        # => false
:no.to_b       # => false
:NO.to_b       # => false
:not.to_b      # => false
:NOT.to_b      # => false
:wherever.to_b # => false
```

#### Numeric
Returns `false` if number is zero. Returns `true` otherwise.

##### Integer
```ruby
0.to_b  # => false
1.to_b  # => true
2.to_b  # => true
-1.to_b # => true
-2.to_b # => true
```

##### Float
```ruby
0.0.to_b  # => false
0.1.to_b  # => true
1.0.to_b  # => true
-0.1.to_b # => true
-1.0.to_b # => true
```

##### BigDecimal
```ruby
require 'bigdecimal'

BigDecimal('0.0').to_b  # => false
BigDecimal('0.1').to_b  # => true
BigDecimal('1.0').to_b  # => true
BigDecimal('-0.1').to_b # => true
BigDecimal('-1.0').to_b # => true
```

#### TrueClass
Returns `true`.

```ruby
true.to_b # => true
```

#### FalseClass
Returns `false`.

```ruby
false.to_b # => false
```

#### NilClass
Returns `false`.

```ruby
nil.to_b # => false
```

#### Creating predicate methods

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


## Contributing to **wannabe_bool**

- Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
- Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
- Fork the project.
- Start a feature/bugfix branch.
- Commit and push until you are happy with your contribution.
- Don't forget to rebase with branch master in main project before submit the pull request.
- Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
- Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

