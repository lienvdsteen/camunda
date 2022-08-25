# frozen_string_literal: true

module Camunda
  module Configuration
    VALID_OPTIONS_KEYS = %i[api_version client_id client_secret audience authorization_url operate_audience
                            operate_base_url].freeze
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
    def reset
      self.api_version = 'v1'
      self.client_id = ENV.fetch('CAMUNDA_CLIENT_ID', nil)
      self.client_secret = ENV.fetch('CAMUNDA_CLIENT_SECRET', nil)
      self.audience = ENV.fetch('CAMUNDA_AUDIENCE', nil)
      self.authorization_url = ENV.fetch('CAMUNDA_AUTHORIZATION_URL', nil)
      self.operate_audience = ENV.fetch('CAMUNDA_OPERATE_AUDIENCE', 'operate.camunda.io')
      self.operate_base_url = ENV.fetch('CAMUNDA_OPERATE_BASE_URL', nil)
    end
  end
end