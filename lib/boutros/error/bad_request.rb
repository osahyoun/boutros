require 'boutros/error/client_error'

module Boutros
  # Raised when 3scale returns the HTTP status code 400
  class Error::BadRequest < Boutros::Error::ClientError
  end
end
