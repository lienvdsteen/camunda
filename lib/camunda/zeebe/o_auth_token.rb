# frozen_string_literal: true

module Camunda
  module Zeebe
    class OAuthToken < Camunda::OAuthResource
      def self.create
        uri = Camunda.authorization_url
        payload = {
          grant_type: 'client_credentials',
          audience: Camunda.zeebe_audience,
          client_id: Camunda.client_id,
          client_secret: Camunda.client_secret
        }

        create_by_uri(uri: uri, payload: payload)
      end
    end
  end
end
