# frozen_string_literal: true

module Camunda
  module Tasklist
    class UserTasks < API
      def self.all # rubocop:disable Metrics:MethodLength
        query = "{
          tasks(query: { state: CREATED })
          {
            id
            taskDefinitionId
            name
            taskState
            assignee
            taskState
            formKey
            processDefinitionId
            completionTime
            processName
            variables {
              name
              value
            }
          }
        }"
        post(query: query)['data']['tasks']
      end

      def self.run_mutation(mutation)
        post(query: mutation)
      end
    end
  end
end
