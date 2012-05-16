module Boutros
  class Client
    module Method

      def methods(service_id, metric_id)
        returning_methods do
          get "/admin/api/services/#{service_id}/metrics/#{metric_id}/methods.xml"
        end
      end

      def method(service_id, metric_id, id)
        returning_method do
          get "/admin/api/services/#{service_id}/metrics/#{metric_id}/methods/#{id}.xml"
        end
      end

      def delete_method(service_id, metric_id, id)
        delete "/admin/api/services/#{service_id}/metrics/#{metric_id}/methods/#{id}.xml"
      end

      def update_method(service_id, metric_id, id, params)
        returning_method do
          put "/admin/api/services/#{service_id}/metrics/#{metric_id}/methods/#{id}.xml", params
        end
      end

      def create_method(service, metric, params)
        returning_method do
          post "/admin/api/services/#{service}/metrics/#{metric}/methods.xml", params
        end
      end

    end
  end
end
