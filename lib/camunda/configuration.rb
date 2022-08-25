# frozen_string_literal: true

module Camunda
  module Configuration
    VALID_OPTIONS_KEYS = %i[api_version client_id client_secret zeebe_audience authorization_url operate_audience
                            operate_base_url console_audience console_base_url zeebe_url tasklist_audience
                            tasklist_base_url].freeze
    attr_accessor(*VALID_OPTIONS_KEYS)

    # Sets all configuration options to their default values
    # when this module is extended.
    def self.extended(base)
      base.reset
    end

    def configure
      yield self
    end

    def config
      VALID_OPTIONS_KEYS.inject({}) do |option, key|
        option.merge!(key => send(key))
      end
    end

    # Resets all configuration options to the defaults.
    def reset # rubocop:disable Metrics:MethodLength
      self.api_version = 'v1'
      self.client_id = ENV.fetch('CAMUNDA_CLIENT_ID', nil)
      self.client_secret = ENV.fetch('CAMUNDA_CLIENT_SECRET', nil)
      self.zeebe_audience = ENV.fetch('CAMUNDA_AUDIENCE', nil)
      self.zeebe_url = ENV.fetch('CAMUNDA_ZEEBE_URL', nil)
      self.authorization_url = ENV.fetch('CAMUNDA_AUTHORIZATION_URL', nil)
      self.operate_audience = ENV.fetch('CAMUNDA_OPERATE_AUDIENCE', 'operate.camunda.io')
      self.operate_base_url = ENV.fetch('CAMUNDA_OPERATE_BASE_URL', nil)
      self.console_audience = ENV.fetch('CAMUNDA_CONSOLE_AUDIENCE', 'api.cloud.camunda.io')
      self.console_base_url = ENV.fetch('CAMUNDA_CONSOLE_BASE_URL', 'https://console.cloud.camunda.io')
      self.tasklist_audience = ENV.fetch('CAMUNDA_TASKLIST_AUDIENCE', 'tasklist.camunda.io')
      self.tasklist_base_url = ENV.fetch('CAMUNDA_TASKLIST_BASE_URL', nil)
    end
  end
end
