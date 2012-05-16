module Boutros
  class Application < Boutros::Base
    attr_reader :id, :created_at, :updated_at, :state, :user_account_id, :application_id
    attr_accessor :name, :extra_fields, :description

    # alias :credit_card_stored? :credit_card_stored

    def keys
      # Boutros::Key.new(@attrs['plan'])
    end

    def plan
      Boutros::Plan.new(@attrs['plan'])
    end

    def status
      # Boutros::Usage.new_from_array
    end

    def save

    end

  end
end
