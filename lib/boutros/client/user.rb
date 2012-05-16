module Boutros
  class Client
    module User

      def users(account)
        returning_users do
          get "/admin/api/accounts/#{account}/users.xml"
        end
      end

      def user(account, user)
        returning_user do
          get "/admin/api/accounts/#{account}/users/#{user}.xml"
        end
      end

      def create_user(account, params)
        returning_user do
          post "/admin/api/accounts/#{account}/users.xml", params
        end
      end

      def delete_user(account, user)
        delete "/admin/api/accounts/#{account}/users/#{user}.xml"
      end

      def update_user(account, user, params)
        returning_user do
          put "/admin/api/accounts/#{account}/users/#{user}.xml", params
        end
      end

      def change_user_role(account, user, role)
        role = role.to_sym == :admin ? 'admin' : 'member'
        returning_user do
          put "/admin/api/accounts/#{account}/users/#{user}/#{role}.xml"
        end
      end

      def suspend_user(account, user)
        returning_user do
          put "/admin/api/accounts/#{account}/users/#{user}/suspend.xml"
        end
      end

      def unsuspend_user(account, user)
        returning_user do
          put "/admin/api/accounts/#{account}/users/#{user}/unsuspend.xml"
        end
      end

      def activate_user(account, user)
        returning_user do
          put "/admin/api/accounts/#{account}/users/#{user}/activate.xml"
        end
      end

    end
  end
end
