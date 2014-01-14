[![Build Status](https://secure.travis-ci.org/svankie/tannenbaum.png)](http://travis-ci.org/svankie/tannenbaum)
[![Gem Version](https://badge.fury.io/rb/tannenbaum.png)](http://badge.fury.io/rb/tannenbaum)

# Tannenbaum

Tannenbaum is an experimental tool for querying currency informal exchange rates.

## Installation

Add this line to your application's Gemfile:

    gem 'tannenbaum'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tannenbaum

## Usage

    [1] pry(main)> require 'tannenbaum'
    => true
    [2] pry(main)> quoting = Tannenbaum::Quote.new
    => #<Tannenbaum::Quote:0x92993bc @provider=Tannenbaum::Providers::USD>
    [3] pry(main)> rates = quoting.ask
    => #<struct Tannenbaum::ExchangeRate
          sell=10.77,
          buy=10.72,
          timestamp= #<DateTime: 2014-01-13T18:50:02+00:00 ((2456671j,67802s,0n),+0s,2299161j)>,
          provider="elDolarBlue">

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
