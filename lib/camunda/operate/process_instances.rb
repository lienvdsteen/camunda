# frozen_string_literal: true

module Camunda
  module Operate
    class ProcessInstances < API
      def self.search(params)
        post('process-instances/search', params)
      end

      def self.find(instance_id)
        get("process-instances/#{instance_id}")
      end
    end
  end
end
