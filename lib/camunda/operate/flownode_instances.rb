# frozen_string_literal: true

module Camunda
  module Operate
    class FlownodeInstances < API
      def self.search(params)
        post('flownode-instances/search', params)
      end

      def self.find(flownode_id)
        get("flownode-instances/#{flownode_id}")
      end
    end
  end
end
