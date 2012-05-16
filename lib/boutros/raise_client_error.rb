require 'faraday'
require 'boutros/error/forbidden'
require 'boutros/error/not_found'
require 'boutros/error/unprocessable_entity'

module Boutros
  module Response
    class RaiseClientError < Faraday::Response::Middleware

      def on_complete(env)
        case env[:status].to_i
        when 403
          raise Boutros::Error::Forbidden.new(error_body(env[:body]))
        when 404
          raise Boutros::Error::NotFound.new(error_body(env[:body]))
        when 422
          raise Boutros::Error::UnprocessableEntity.new(error_body(env[:body]))
        end
      end

      private

      def error_body(body)
        body = body.nil? ? body : Nori.parse(body)
        if body.nil?
          ''
        elsif body['errors']
          Array(body['errors']['error']).join(' | ')
        elsif body['error']
          body['error']
        end
      end

    end
  end
end
