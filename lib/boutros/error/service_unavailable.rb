require 'boutros/error/server_error'

module Boutros
  # Raised when 3scale returns the HTTP status code 503
  class Error::ServiceUnavailable < Boutros::Error::ServerError
  end
end
