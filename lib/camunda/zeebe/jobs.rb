# frozen_string_literal: true

module Camunda
  module Zeebe
    class Jobs < API
      def self.add_error(job_id:, error_code:, error_message: nil)
        params = {
          jobKey: job_id,
          errorCode: error_code
        }
        params[:errorMessage] = error_message if error_message.present?
        run(:throw_error, ::Zeebe::Client::GatewayProtocol::ThrowErrorRequest.new(params))
      end
    end
  end
end
