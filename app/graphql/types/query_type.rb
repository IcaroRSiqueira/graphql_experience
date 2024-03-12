# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :policy, Types::PolicyType, null: false, description: "Fetches an policy information given its ID" do
      argument :policy_id, ID, required: true, description: "ID of the object."
    end

    def policy(policy_id:)
      PoliciesRestApi::Client.get_policy_by_id(policy_id)
    end
  end
end
