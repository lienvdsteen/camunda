# frozen_string_literal: true

module Camunda
  module Console
    class Clients < API
      def self.all(cluster_id)
        get("clusters/#{cluster_id}/clients")
      end
    end
  end
end
