require 'boutros/base'

module Boutros
  class Plan < Boutros::Base
    attr_reader :id, :name, :type, :state, :default
    alias :default? :default

  end
end