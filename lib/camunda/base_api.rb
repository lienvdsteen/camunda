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

    def self.patch(endpoint, params = {})
      url = build_url(endpoint)

      response = RestClient.patch(
        url,
        params.to_json,
        headers
      )

      JSON.parse(response.body)
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

# Zeebe::Client::GatewayProtocol::ActivatedJob: key: 4503599775908706,
# type: "pre-offboarding-inform-slack-dev",
# processInstanceKey: 4503599775908700,
# bpmnProcessId: "pre-offboarding-automated-steps-dev",
# processDefinitionVersion: 2, processDefinitionKey: 2251799962638940,
# elementId: "Activity_1yisk0d", elementInstanceKey: 4503599775908705, customHeaders: "{}",
# worker: "offboarding:inform_offboarding_channel", retries: 1, deadline: 1686334733449,
# variables: "{"employee_id":2641841204932640877}">
