# frozen_string_literal: true

require_relative 'camunda/version'
require_relative 'camunda/configuration'
require_relative 'camunda/util'
require_relative 'camunda/o_auth_resource'
require_relative 'camunda/operate'
require_relative 'camunda/console'
require_relative 'camunda/zeebe'

module Camunda
  extend Configuration
end
