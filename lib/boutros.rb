require "boutros/version"
require 'boutros/client'
require 'boutros/config'

module Boutros
  extend Config

  class << self
    # Alias for Boutros::Client.new
    #
    # @return [Boutros::Client]
    def new(options={})
      Boutros::Client.new(options)
    end

    # Delegate to Boutros::Client
    def method_missing(method, *args, &block)
      return super unless new.respond_to?(method)
      new.send(method, *args, &block)
    end

    def respond_to?(method, include_private=false)
      new.respond_to?(method, include_private) || super(method, include_private)
    end
  end
end