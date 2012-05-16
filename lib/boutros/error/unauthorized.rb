require 'boutros/error/client_error'

module Boutros
  # Raised when 3scale returns the HTTP status code 401
  class Error::Unauthorized < Boutros::Error::ClientError
  end
end
