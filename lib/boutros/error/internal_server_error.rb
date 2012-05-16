require 'boutros/error/server_error'

module Boutros
  # Raised when 3scale returns the HTTP status code 500
  class Error::InternalServerError < Boutros::Error::ServerError
  end
end
