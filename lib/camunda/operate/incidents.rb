# frozen_string_literal: true

module Camunda
  module Operate
    class Incidents < API
      def self.search(params)
        post('incidents/search', params)
      end

      def self.find(incident_id)
        get("incidents/#{incident_id}")
      end
    end
  end
end
