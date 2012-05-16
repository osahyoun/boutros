require 'boutros/error/server_error'

module Boutros
  # Raised when 3scale returns the HTTP status code 502
  class Error::BadGateway < Boutros::Error::ServerError
  end
end
