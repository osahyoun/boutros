require 'boutros/error'

module Boutros
  # Raised when 3scale returns a 4xx HTTP status code
  class Error::ClientError < Boutros::Error
  end
end
