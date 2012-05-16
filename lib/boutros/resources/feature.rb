require 'boutros/base'

module Boutros
  class Feature < Boutros::Base
    attr_reader :id, :name, :system_name, :account_id, :scope

  end
end