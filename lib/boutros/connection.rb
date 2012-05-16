require 'faraday'
require 'boutros/response'
require 'boutros/raise_client_error'
require 'boutros/raise_server_error'

module Boutros
  module Connection

    private

    def connection(options={})
      default_options = {
         :headers => {
           :accept => 'application/xml',
           :user_agent => user_agent
         },
         :url => options.fetch(:domain, domain)
       }

      @connection ||=Faraday.new(default_options) do |builder|
        builder.request  :url_encoded
        builder.adapter  :net_http
        # builder.response :logger
        builder.use Boutros::Response::ParseXML
        builder.use Boutros::Response::RaiseClientError
        builder.use Boutros::Response::RaiseServerError
      end
    end
  end
end