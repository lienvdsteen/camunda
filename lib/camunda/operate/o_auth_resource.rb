# frozen_string_literal: true

module Camunda
  module Operate
    class OAuthResource
      def self.create_by_uri(uri:, payload:)
        headers = {
          authorization: "Basic #{Base64.strict_encode64("#{Cloudmunda.client_id}:#{Cloudmunda.client_secret}")}",
          'Content-Type': 'application/json'
        }

        response = RestClient.post(uri, payload.to_json, headers)
        parsed_response = JSON.parse(response.body)

        parsed_response = {} if parsed_response == ''
        parsed_response
      end
    end
  end
end
