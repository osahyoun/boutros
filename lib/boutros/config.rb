module Boutros
  module Config

    # https://aljazeera-admin.3scale.net
    DEFAULT_KEY = ''
    DEFAULT_DOMAIN = ''
    DEFAULT_USER_AGENT = "Boutros Ruby Gem"

    VALID_OPTIONS_KEYS = [:key, :domain, :user_agent]

    attr_accessor *VALID_OPTIONS_KEYS

    def self.extended(base)
      base.reset
    end

    def reset
      self.domain = DEFAULT_DOMAIN
      self.key = DEFAULT_KEY
      self.user_agent = DEFAULT_USER_AGENT
    end

    def options
      options = {}
      VALID_OPTIONS_KEYS.each{|k| options[k] = send(k)}
      options
    end
  end
end