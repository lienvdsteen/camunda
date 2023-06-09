# frozen_string_literal: true

module Camunda
  module Tasklist
    class API < ::Camunda::BaseAPI
      def self.base_url
        Camunda.tasklist_base_url
      end

      def self.oauth_token
        Camunda::Tasklist::OAuthToken.create['access_token']
      end
    end
  end
end
