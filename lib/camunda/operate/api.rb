# frozen_string_literal: true

module Camunda
  module Operate
    class API < ::Camunda::BaseAPI
      def self.base_url
        Camunda.operate_base_url
      end

      def self.oauth_token
        Camunda::Operate::OAuthToken.create['access_token']
      end
    end
  end
end
