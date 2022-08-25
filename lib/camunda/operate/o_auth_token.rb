# frozen_string_literal: true

module Camunda
  module Operate
    class OAuthToken < OAuthResource
      def self.create
        uri = Camunda.authorization_url
        payload = {
          grant_type: 'client_credentials',
          audience: Camunda.operate_audience,
          client_id: Camunda.client_id,
          client_secret: Camunda.client_secret
        }

        create_by_uri(uri: uri, payload: payload)
      end
    end
  end
end
