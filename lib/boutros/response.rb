require 'faraday'
require 'nori'
# require 'crack/xml'

module Boutros
  module Response
    class ParseXML < Faraday::Response::Middleware

      def parse(body)
        body.empty? ? "" : Nori.parse(body).values.first
      end

      def on_complete(env)
        if respond_to? :parse
          env[:body] = parse(env[:body]) unless env[:request][:raw] or [204,304].index env[:status]
        end
      end
    end
  end
end
