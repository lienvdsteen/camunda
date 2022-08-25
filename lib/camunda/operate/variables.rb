# frozen_string_literal: true

module Camunda
  module Operate
    class Incidents < API
      def self.search(params)
        post('variables/search', params)
      end

      def self.find(variable_id)
        get("variables/#{variable_id}")
      end
    end
  end
end
