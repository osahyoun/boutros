require 'boutros/error/client_error'

module Boutros
  # Raised when Boutros returns the HTTP status code 422
  class Error::UnprocessableEntity < Boutros::Error::ClientError
  end
end
