module Boutros
  # Custom error class for rescuing from all 3scale errors
  class Error < StandardError
    # Initializes a new Error object
    #
    # @param message [String]
    # @param http_headers [Hash]
    # @return [Boutros::Error]
    def initialize(message)
      super(message)
    end

  end
end
