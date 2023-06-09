# frozen_string_literal: true

module Camunda
  module Tasklist
    class UserTasks < API
      def self.all(params = {})
        post('tasks/search', params)
      end

      def self.complete_task(task_id, variables = {})
        patch("tasks/#{task_id}/complete", variables)
      end

      def self.variables(task_id, params = {})
        post("tasks/#{task_id}/variables/search", params)
      end
    end
  end
end
