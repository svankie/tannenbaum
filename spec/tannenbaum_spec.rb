require "tannenbaum"

describe Tannenbaum do
  describe Tannenbaum::Quote do
    it "shows the current exchange rates and timestamp for a given currency" do
      quotation = Tannenbaum::Quote.new(:USD)
      
      exchange_rates = quotation.ask

      exchange_rates.sell.should be_a(Float)
      exchange_rates.buy.should be_a(Float)
      
      exchange_rates.timestamp.should be_a(DateTime)
    end

    it "fails when trying to quote a non-existant currency" do
      expect { Tannenbaum::Quote.new(:ANT) }.to raise_exception(Tannenbaum::Exceptions::InvalidCurrencyException)
    end
  end
end
