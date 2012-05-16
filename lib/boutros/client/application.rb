module Boutros
  class Client
    module Application

      def application(account, application)
        returning_application do
          get "/admin/api/accounts/#{account}/applications/#{application}.xml"
        end
      end

      def create_application(account, application, params)
        returning_application do
          post "/admin/api/accounts/#{account}/applications.xml", params
        end
      end

      def update_application(account, application, params)
        returning_application do
          put "/admin/api/accounts/#{account}/applications/#{application}.xml", params
        end
      end

      def change_application_plan(account, application, params)
        returning_application do
          put "/admin/api/accounts/#{account}/applications/#{application}/change_plan.xml", params
        end
      end

      def accept_application(account, application)
        returning_application do
          put "/admin/api/accounts/#{account}/applications/#{application}/accept.xml"
        end
      end

      def suspend_application(account, application)
        returning_application do
          put "/admin/api/accounts/#{account}/applications/#{application}/suspend.xml"
        end
      end

      def resume_application(account, application)
        returning_application do
          put "/admin/api/accounts/#{account}/applications/#{application}/resume.xml"
        end
      end

      def create_application_key(account, application)
        returning_application do
          post "/admin/api/accounts/#{account}/applications/#{application}/keys.xml"
        end
      end

      def delete_application_key(account, application, key)
        returning_application do
          delete "/admin/api/accounts/#{account}/applications/#{application}/keys/#{key}.xml"
        end
      end

    end
  end
end
