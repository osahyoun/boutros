module Boutros
  class Client
    module Feature

      def features(plan=nil)
        data = if(plan)
          plan_id = plan.kind_of?(Boutros::Plan) ? plan.id : plan
          get("/admin/api/account_plans/#{plan_id}/features.xml")
        else
          get("/admin/api/features.xml")
        end
        Boutros::Feature.new_from_array(data)
      end

      def feature(feature_id)
        Boutros::Feature.new(get("/admin/api/features/#{feature_id}.xml"))
      end

      def update_feature(feature_id, params)
        Boutros::Feature.new(put("/admin/api/features/#{feature_id}.xml", params))
      end

      def delete_feature(feature_id)
        delete("/admin/api/features/#{feature_id}.xml")
      end

      def create_feature(params)
        Boutros::Feature.new(post("/admin/api/features.xml", params))
      end

    end
  end
end