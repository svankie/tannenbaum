module Tannenbaum
  module Providers
    # Our exchange rate data providers are defined here as separate classes.
    class USD
      # The name of the [Provider].
      def self.name
        "elDolarBlue"
      end
      
      # The URL of the [Provider].
      def self.url
        "http://www.eldolarblue.net/getDolarBlue.php?as=xml"
      end
    end
  end
end
