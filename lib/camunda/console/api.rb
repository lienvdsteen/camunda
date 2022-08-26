# frozen_string_literal: true

module Camunda
  module Console
    class API < ::Camunda::BaseAPI
      def self.base_url
        Camunda.console_base_url
      end

      def self.oauth_token
        Camunda::Console::OAuthToken.create['access_token']
      end
    end
  end
end
