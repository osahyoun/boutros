require 'boutros/error/client_error'

module Boutros
  # Raised when 3scalereturns the HTTP status code 403
  class Error::Forbidden < Boutros::Error::ClientError
  end
end
