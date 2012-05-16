module Boutros
  class Service < Boutros::Base
    attr_accessor :id, :account_id, :name, :state

    def methods
      []
    end

    def metrics
      []
    end
  end
end