# frozen_string_literal: true

module Camunda
  module Zeebe
    class ProcessInstances < API
      def self.create(params)
        run(:create_process_instance,
            ::Zeebe::Client::GatewayProtocol::CreateProcessInstanceRequest.new(params))
      end
    end
  end
end
