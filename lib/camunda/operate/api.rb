# frozen_string_literal: true

require 'rest-client'
require 'json'
require 'uri'
require 'base64'
require 'csv'

module Camunda
  module Operate
    class API
      def self.get(endpoint, params = {})
        url = build_url(endpoint, params)
        response = RestClient.get(url, headers)

        JSON.parse(response.body)
      end

      def self.post(endpoint, params = {})
        url = build_url(endpoint)
        response = RestClient.post(
          url,
          params.to_json,
          headers.merge({'Content-Type': 'application/json'})
        )

        JSON.parse(response.body) if response.code == 200
      end

      def self.build_url(endpoint, params = {})
        url = "#{Camunda.operate_base_url}/#{Camunda.api_version}/#{endpoint}"
        url += "?#{URI.encode_www_form(params)}" unless params.empty?

        url
      end

      def self.headers
        {
          Authorization: "Bearer #{oauth_token}"
        }
      end

      def self.oauth_token
        Camunda::Operate::OAuthToken.create['access_token']
      end
    end
  end
end
