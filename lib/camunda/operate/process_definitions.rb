# frozen_string_literal: true

module Camunda
  module Operate
    class ProcessDefinitions < API
      def self.search(params)
        post('process-definitions/search', params)
      end

      def self.find(definition_id)
        get("process-definitions/#{definition_id}")
      end
    end
  end
end
