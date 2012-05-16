module Boutros
  class Account < Boutros::Base
    attr_reader :id, :created_at, :update_at, :state, :org_name, :extra_fields, :credit_card_stored
    attr_accessor :org_name, :extra_fields

    alias :credit_card_stored? :credit_card_stored

    def users
      Boutros::User.new_from_array(@attrs['users'])
    end

    def plans
      Boutros::Plan.new_from_array(@attrs['plans'])
    end

    def save
      @client.update_account(id, {:org_name => org_name})
    end

  end
end
