# frozen_string_literal: true

module Camunda
  module Zeebe
    class ProcessInstances < API
      def self.create(process_id:, variables: {}, version: -1)
        params = {
          bpmnProcessId: process_id,
          variables: variables.to_json,
          version: version
        }
        run(:create_process_instance, ::Zeebe::Client::GatewayProtocol::CreateProcessInstanceRequest.new(params))
      end

      def self.cancel(processInstanceKey:)
        run(:cancel_process_instance, ::Zeebe::Client::GatewayProtocol::CancelProcessInstanceRequest.new(processInstanceKey: processInstanceKey))
      end

      def self.update_variables(instance_id:, variables:)
        params = {
          elementInstanceKey: instance_id,
          variables: variables.to_json
        }
        run(:set_variables, ::Zeebe::Client::GatewayProtocol::SetVariablesRequest.new(params))
      end
    end
  end
end
