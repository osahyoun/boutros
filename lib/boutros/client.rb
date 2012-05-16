require 'boutros/resources/feature'
require 'boutros/resources/plan'
require 'boutros/resources/account'
require 'boutros/resources/service'
require 'boutros/resources/application'
require 'boutros/resources/user'
require 'boutros/resources/method'
require 'boutros/resources/metric'

require 'boutros/config'
require 'boutros/instantiators'

module Boutros
  class Client
    include Boutros::Instantiators

    require 'boutros/connection'
    include Boutros::Connection

    require 'boutros/request'
    include Boutros::Request

    require 'boutros/client/account'
    include Boutros::Client::Account

    require 'boutros/client/service'
    include Boutros::Client::Service

    require 'boutros/client/user'
    include Boutros::Client::User

    require 'boutros/client/feature'
    include Boutros::Client::Feature

    require 'boutros/client/plan'
    include Boutros::Client::Plan

    require 'boutros/client/method'
    include Boutros::Client::Method

    require 'boutros/client/metric'
    include Boutros::Client::Metric

    require 'boutros/client/application'
    include Boutros::Client::Application

    attr_accessor *Config::VALID_OPTIONS_KEYS

    def initialize(attrs={})
      attrs = Boutros.options.merge(attrs)
      Config::VALID_OPTIONS_KEYS.each do |key|
        instance_variable_set("@#{key}".to_sym, attrs[key])
      end
    end
  end
end
