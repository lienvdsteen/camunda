# frozen_string_literal: true

module Camunda
  module Tasklist
    class API
      def self.post(params = {})
        response = RestClient.post(Camunda.tasklist_base_url, params.to_json, headers)
        JSON.parse(response.body)
      end

      def self.headers
        oauth_token = Camunda::Tasklist::OAuthToken.create
        {
          authorization: "Bearer #{oauth_token['access_token']}",
          'Content-Type': 'application/json'
        }
      end
    end
  end
end
