module Boutros
  module Instantiators
    private

    def returning_account
      Boutros::Account.new(yield, self)
    end

    def returning_accounts
      Boutros::Account.new_from_array(yield, self)
    end

    def returning_method
      Boutros::Method.new(yield, self)
    end

    def returning_methods
      Boutros::Method.new_from_array(yield, self)
    end

    def returning_metric
      Boutros::Metric.new(yield, self)
    end

    def returning_metrics
      Boutros::Metric.new_from_array(yield, self)
    end

    def returning_user
      Boutros::User.new(yield, self)
    end

    def returning_users
      Boutros::User.new_from_array(yield, self)
    end

    def returning_plan
      Boutros::Plan.new(yield, self)
    end

    def returning_plans
      Boutros::Plan.new_from_array(yield, self)
    end

    def returning_service
      Boutros::Service.new(yield, self)
    end

    def returning_services
      Boutros::Service.new_from_array(yield, self)
    end

    def returning_application
      Boutros::Application.new(yield, self)
    end

  end
end