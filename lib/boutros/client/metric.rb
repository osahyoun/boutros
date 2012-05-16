module Boutros
  class Client
    module Metric

      def metrics(service)
        returning_metrics do
          get "/admin/api/services/#{service}/metrics.xml"
        end
      end

      def metric(service, id)
        returning_metric do
          get "/admin/api/services/#{service}/metrics/#{id}.xml"
        end
      end

      def delete_metric(service, id)
        delete "/admin/api/services/#{service}/metrics/#{id}.xml"
      end

      def update_metric(service, id, params)
        returning_metric do
          put "/admin/api/services/#{service}/metrics/#{id}.xml", params
        end
      end

      def create_metric(service, params)
        returning_metric do
          post "/admin/api/services/#{service}/metrics.xml", params
        end
      end

    end
  end
end
