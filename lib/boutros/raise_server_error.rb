require 'faraday'
require 'boutros/error/bad_gateway'
require 'boutros/error/internal_server_error'
require 'boutros/error/service_unavailable'

module Boutros
  module Response
    class RaiseServerError < Faraday::Response::Middleware

      def on_complete(env)
        case env[:status].to_i
        when 500
          raise Boutros::Error::InternalServerError.new("Something is wrong with 3scale")
        when 502
          raise Boutros::Error::BadGateway.new("3scale isn't available at the moment")
        when 503
          raise Boutros::Error::ServiceUnavailable.new("3scale isn't available at the moment")
        end
      end

    end
  end
end
