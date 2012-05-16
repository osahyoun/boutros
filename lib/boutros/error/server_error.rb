require 'boutros/error'

module Boutros
  # Raised when 3scale returns a 5xx HTTP status code
  class Error::ServerError < Boutros::Error
  end
end
