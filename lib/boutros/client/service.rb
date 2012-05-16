module Boutros
  class Client
    module Service

      def services
        returning_services do
          get "/admin/api/services.xml"
        end
      end

      def service(service)
        returning_service do
          get "/admin/api/services/#{service}.xml"
        end
      end

      def delete_service(service)
        delete "/admin/api/services/#{service}.xml"
      end

      def update_service(service, params)
        returning_service do
          put "/admin/api/services/#{service}.xml", params
        end
      end

      def create_service(params)
        returning_service do
          post "/admin/api/services.xml", params
        end
      end

    end
  end
end
