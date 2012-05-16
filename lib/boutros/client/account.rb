module Boutros
  class Client
    module Account

      def account(account)
        returning_account do
          get "/admin/api/accounts/#{account}.xml"
        end
      end

      def update_account(account, params)
        returning_account do
          put "/admin/api/accounts/#{account}.xml", params
        end
      end

      def change_account_plan(account, params)
        returning_plan do
          put "/admin/api/accounts/#{account}/change_plan.xml", params
        end
      end

      def approve_account(account)
        returning_account do
          put "/admin/api/accounts/#{account}/approve.xml"
        end
      end

      def reject_account(account)
        returning_account do
          put "/admin/api/accounts/#{account}/reject.xml"
        end
      end

      def make_account_pending(account)
        returning_account do
          put "/admin/api/accounts/#{account}/make_pending.xml"
        end
      end

      def accounts
        returning_accounts do
          get("/admin/api/accounts.xml")
        end
      end

    end
  end
end
