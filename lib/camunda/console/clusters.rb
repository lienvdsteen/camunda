# frozen_string_literal: true

module Camunda
  module Console
    class Clusters < API
      def self.all
        get('clusters')
      end
    end
  end
end
