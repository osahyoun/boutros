module Boutros
  class User < Boutros::Base
    attr_reader :id, :created_at, :updated_at, :account_id,
    :state, :role, :username, :email, :extra_fields

  end
end