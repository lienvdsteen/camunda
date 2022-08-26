# frozen_string_literal: true

require 'rest-client'
require 'json'
require 'uri'
require 'base64'

module Camunda
  class BaseAPI
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
        headers
      )

      JSON.parse(response.body) if response.code == 200
    end

    def self.build_url(endpoint, params = {})
      url = "#{base_url}/#{Camunda.api_version}/#{endpoint}"
      url += "?#{URI.encode_www_form(params)}" unless params.empty?

      url
    end

    def self.headers
      {
        Authorization: "Bearer #{oauth_token}",
        Accept: 'application/json',
        'Content-Type': 'application/json'
      }
    end
  end
end
