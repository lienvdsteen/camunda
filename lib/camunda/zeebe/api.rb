# frozen_string_literal: true

require 'zeebe/client'

module Camunda
  module Zeebe
    class API
      def self.run(method, params = {})
        client.public_send(method, params)
      rescue ::GRPC::Unavailable => e
        Rails.logger.error e.message # TODO: give people options to use other logger
        raise e
      end

      def self.client
        ::Zeebe::Client::GatewayProtocol::Gateway::Stub.new(Camunda.zeebe_url, authentication_headers)
      end

      def self.authentication_headers
        token = Camunda::Zeebe::OAuthToken.create
        channel_creds = GRPC::Core::ChannelCredentials.new
        auth_proc = proc { { 'authorization' => "Bearer #{token['access_token']}" } }
        call_creds = GRPC::Core::CallCredentials.new(auth_proc)
        channel_creds.compose(call_creds)
      end
    end
  end
end
