require 'boutros/error/client_error'

module Boutros
  # Raised when 3scale returns the HTTP status code 404
  class Error::NotFound < Boutros::Error::ClientError
  end
end
