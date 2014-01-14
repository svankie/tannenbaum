require "nokogiri"
require "open-uri"

module Tannenbaum
  class Scraper
    # A [Scraper] that fetches and parses the exchange rate data from our -for now- only [Provider]. 
    def initialize(supplier)
      @url = supplier.url
      @provider = supplier.provider
    end

    # Processes the XML response of our [Provider]
    # and return it as a [Hash].
    #
    # @return [Hash] with fresh exchange rate data.
    def process
      xml_response = open(@url) rescue Hash.new
      quote = Nokogiri::XML(xml_response)
      parse_exchange_rates(quote)
    end

    private

    def parse_exchange_rates(quote)
      result = [:sell, :buy].inject({}) do |rates, key|
        rate = extract_node_value(quote, key)
        rates[key] = sanitize_rate!(rate)
        rates
      end
      # XXX: yeah, it's hardcoded. mayhaps every ::Provider 
      # should have its own ::Scraper. i've to implement it.
      timestamp = extract_node_value(quote, :datetime)
      result[:timestamp] = parse_timestamp!(timestamp)

      result[:provider] = @provider

      result
    end

    def extract_node_value(node, key)
      node.xpath("//#{key.to_s}").text
    end

    def sanitize_rate!(value, precision = 2)
      value.to_f.round(precision)
    end

    def parse_timestamp!(timestamp)
      DateTime.parse(timestamp) rescue DateTime.now
    end
  end 
end
