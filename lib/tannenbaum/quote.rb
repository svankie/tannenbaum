# encoding: utf-8

module Tannenbaum
  class Quote
    # The [Quote] class defines our medium for getting informal exchange rate
    # information for a given currency on a given [Provider].
    def initialize(currency = :USD)
      fail Tannenbaum::Exceptions::InvalidCurrencyException \
        unless Tannenbaum::Providers.constants.include?(currency)
      @provider = get_provider(currency)
    end

    # Retrieves the latest exchange rate prices according to our [Provider].
    #
    # @param ensure_fresh [Boolean]
    # @return [ExchangeRate]
    def ask(ensure_fresh = false)
      if ensure_fresh
        @exchange_rates = fetch_current_exchange_rates
      else
        @exchange_rates ||= fetch_current_exchange_rates
      end
    end

    private

    def get_provider(currency)
      Tannenbaum::Providers.const_get(currency)
    end

    def fetch_current_exchange_rates
      raw_exchange_data = Tannenbaum::Scraper.new(@provider).process
      Tannenbaum::ExchangeRate.new(raw_exchange_data)
    end
  end

  class ExchangeRate < Struct.new(:sell, :buy, :timestamp, :provider)
    def initialize(hash)
      super(*hash.values_at(:sell, :buy, :timestamp, :provider))
    end
  end
end
