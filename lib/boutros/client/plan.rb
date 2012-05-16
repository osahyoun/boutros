module Boutros
  class Client
    module Plan

      def plans
        returning_plans do
          get "/admin/api/account_plans.xml"
        end
      end

      def plan(plan_id)
        returning_plan do
          get "/admin/api/account_plans/#{plan_id}.xml"
        end
      end

    end
  end
end
